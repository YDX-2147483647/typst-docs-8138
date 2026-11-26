# Contributing guidelines

## Bump to a newer version of Typst

> [!NOTE]
>
> Usually, only maintainers do this.

### What and when to bump

We have two versions in this project: _typst docs_ version and _typst docit_ version.

- The _typst docs_ version describes the contents of the upstream documentation.

  This version is pinned in the `TYPST_REF` variable in [`justfile`](./justfile). All contributors and environments should use the same version; otherwise, conflicts may occur.

  The typst docs version on the `base` branch should be bumped whenever convenient. The `locale` branch can merge the updates from the `base` branch when the translation work pauses.

- The _typst docit_ version describes the generator for the documentation, also known as `cargo docit` or the typst-docs CLI.

  This version is saved as `inputs.ref` in the CI config ([`cache-docit.yml`](./.github/workflows/cache-docit.yml)). The saved version of typst docit is guaranteed to work, but other versions around the same time usually work as well.

  The saved version on the `base` branch should be bumped only when the old version no longer works with newer typst docs. The `locale` branch does not require special handling for typst docit, as its version will be automatically updated when merging typst docs updates from the `base` branch.

### How to bump

The following is the typical workflow for bumping typst docs and typst docit versions.

1. Run `git switch --create base-bump base`. Change `TYPST_REF` in `justfile` to the full hash of the newest commit in the [typst repo](https://github.com/typst/typst). Then submit a pull request from `base-bump` to `base`.

   An example commit message is shown below, where fe537181de is the abbreviated commit hash, and 2026-10-27 is the committer date.

   > chore: bump typst docs to fe537181de 2026-10-27

2. Wait for the CI results. If [autofix.ci](https://autofix.ci) fails to apply automated fixes, check the errors; otherwise, skip this step.

   - If `just setup` fails with _error: `…/*.typ`: patch does not apply_, then we have to port upstream changes to Typst files (e.g., a new UI tooltip that needs to be localized).

     You can resolve it locally by running the following commands.

     ```sh
     git switch --detach HEAD^ && just resetup && git switch -

     cd target/typst/
     git stash && just resetup && git stash pop
     # If there are conflicts, resolve them.
     # If not, run `git log` and see if there are any changes requiring localization.

     cd -
     just save-patches
     git commit --amend
     ```

   - If the error messages seem cryptic or irrelevant, try editing `inputs.ref` in `cache-docit.yml` to sync the typst docit version with typst docs.

   After edits, explain the changes in your commit message, and link to related upstream PRs in your PR description if necessary. An example is as follows.

   Commit message:

   > chore: bump typst docs and typst docit to fe537181de 2026-10-27 to support `info.locatable`

   PR description:

   > This PR bumps typst docs and typst docit to the latest commit.
   >
   > typst/typst#9019 added `info.locatable`. This forces us to bump typst docit.

3. If CI still fails after the autofix.ci commit (which is unlikely), fix the errors.

4. Review autofix.ci fixes.

   For `patches/`, if there are non-trivial changes, inspect the upstream git log and see what happened. There might be new changes that need localization.

   For `locale/`, quickly scroll through the changes.

   - If there are large non-trivial changes in a file, check whether it is caused by a bug in our `patches/` or by a normal upstream PR.
   - It is okay if you see a line number changed but the doc before it did not. The upstream might have refactored it. You can inspect the upstream git log if you are curious.

5. Merge your PR.

