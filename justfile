set minimum-version := '1.55.0'
set shell := ["bash", "-uc"] # Some recipes requires brace expansion.

TYPST_REF := "9f2b6e8715237cb086899a42873660fe744622e8"

typstyle := "typstyle --line-width 120"

# List available recipes
@list:
    just --list

# Setup target/typst/docs/ and apply patches; after `git clone`, please run this recipe before running other recipes
[group("for contributors")]
setup: && resetup
    #!/usr/bin/env bash
    set -euxo pipefail

    mkdir -p target && cd target
    git clone --depth 1 --no-checkout --filter="tree:0" --no-tags https://github.com/typst/typst

    cd typst
    git sparse-checkout init
    git sparse-checkout set docs
    git switch --detach {{ TYPST_REF }}

# Reset target/typst/docs/ and re-apply patches; after `git switch`, run this recipe if you meet any problems
[group("for contributors")]
[working-directory("target/typst/docs/")]
resetup:
    git restore .
    # ✋ Please confirm that there are no untracked files except i18n-*.typ and locale/.
    # Enter `c` if that is true. (or do nothing if git has not prompted you)
    git clean -d --interactive
    git switch --detach {{ TYPST_REF }}

    git apply --ignore-whitespace ../../../patches/*.diff
    rm main.typ
    ln --symbolic \
        {{ quote(clean("../../../patches/main.typ")) }} \
        {{ quote(clean("../../../patches/i18n.typ")) }} \
        {{ quote(clean("../../../patches/i18n-babel.typ")) }} \
        {{ quote(clean("../../../patches/i18n-inputs.typ")) }} \
        {{ quote(clean("../../../patches/i18n-insertions.typ")) }} \
        {{ quote(clean("../../../patches/i18n-scope.typ")) }} \
        {{ quote(clean("../../../patches/i18n-translation.typ")) }} \
        {{ quote(clean("../../../locale")) }} \
        .

# Save patches from target/typst/docs/
[group("for maintainers")]
[working-directory("target/typst/")]
save-patches:
    git diff --no-ext-diff --abbrev=10 docs/assets/ > ../../patches/assets.diff
    git diff --no-ext-diff --abbrev=10 docs/components/ > ../../patches/components.diff
    git diff --no-ext-diff --abbrev=10 docs/content/index.typ > ../../patches/content-index.diff

# Prepare the mode for i18n; callers should keep import-l10n as the default mode
[arg("MODE", pattern='export-i18n|import-l10n')]
[private]
[working-directory("target/typst/")]
prepare-mode MODE:
    git sparse-checkout set {{ if MODE == "export-i18n" { "docs crates" } else { "docs" } }}

# Call the typst-docs CLI
[private]
[working-directory("target/typst/")]
docit *ARGS:
    ../typst-docs {{ ARGS }} --workspace .

# Export texts for internationalization to target/i18n-export/
[group("for maintainers")]
[working-directory("target/typst/")]
export-i18n: setup-babelize (prepare-mode "export-i18n") (docit "compile" "--format=website" "--input" "i18n--mode=export-i18n") (prepare-mode "import-l10n")
    rm -rf ../i18n-export/
    mv docs/dist/site/i18n-export/ ../

    cp -r docs/content/ ../i18n-export/
    rm -r ../i18n-export/content/{index.typ,changelog/}
    sd --max-replacements=1 \
        '#import "(\.\./)+components/index.typ"' \
        '#import "/i18n-scope.typ": babel\n#import "/components/index.typ"' \
        $(fd . --type file ../i18n-export/content/)

    {{ typstyle }} --inplace ../i18n-export/
    # ✅ Now you can compare target/i18n-export/ with locale/
# export-i18n requires `--format=website`, because it relies on `asset`, which does not work with `--format=pdf`.

# Start and open the server for website docs
[group("for contributors")]
serve: (docit "watch" "--format=website" "--open")

# Compile the docs as PDF and website to target/dist/
[group("for contributors")]
build *SYS_INPUTS: (docit "compile" "--format=pdf" "--deny-warnings" SYS_INPUTS) (docit "compile" "--format=website" "--deny-warnings" SYS_INPUTS)
    -rm -rf target/dist/
    mv target/typst/docs/dist/ target/
    # ✅ Now you can view or deploy target/dist/

# Build the project to target/dist/ for CI
[arg("BASE", pattern='/|(/.+/)')]
[group("for maintainers")]
ci-build BASE="/base/":
    just build --input "i18n--base={{ BASE }}" --input i18n--link-pdf-docs=true --input i18n--enable-pagefind=true
    mv target/dist/site{{ BASE }}* target/dist/
    mv target/dist/docs.pdf target/dist/typst-documentation.pdf
    pdfcpu optimize target/dist/typst-documentation.pdf
    pagefind_extended --site target/dist/
# Cloudflare Workers supports assets with sizes of up to 25 MiB, but the raw PDF is about 27 MiB.
# 7-Zip reduces it to 11 MiB, while pdfcpu reduces it to 15 MiB.
# Both are acceptable, but *.pdf is easier to access than *.pdf.zip, so we choose pdfcpu.

# Build and setup the babelize Wasm plugin
[group("for maintainers")]
setup-babelize:
    cargo build --release --target wasm32-unknown-unknown --manifest-path scripts/babelize/Cargo.toml
    -rm patches/babelize.wasm
    ln --symbolic {{ quote(clean("../scripts/babelize/target/wasm32-unknown-unknown/release/babelize.wasm")) }} patches/

# Format files
fmt:
    {{ typstyle }} --inplace locale/ patches/
    just --fmt
    cargo fmt --manifest-path scripts/babelize/Cargo.toml
