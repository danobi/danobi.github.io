# bpftrace website

### Sending PRs

Please make markdown changes in `src/`. Then run `make` from the project root.
Commit all the changes then send the PR.

### Updating documentation

All documentation is currently vendored in `src/docs`. When updating, please copy
in un-edited files directly from bpftrace repository.

When adding a documentation for a new release, you'll also want to update
`src/header.html` with a new drop-down selection. You'll also want to update
`index.md` to point to the latest release.

### Notes

* Followed https://gist.github.com/matt-bailey/bbbc181d5234c618e4dfe0642ad80297
  to set up DNS records
