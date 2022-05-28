# DreamOps Orb

[![CircleCI Build Status](https://circleci.com/gh/apaxsoftware/dream-ops-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/apaxsoftware/dream-ops-orb) [![CircleCI Orb Version](https://badges.circleci.com/orbs/apaxsoftware/dream-ops.svg)](https://circleci.com/orbs/registry/orb/apaxsoftware/dream-ops) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/apaxsoftware/dream-ops-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)


CircleCI orb for installing and configuring the [dream-ops](https://rubygems.org/gems/dream-ops) CLI in your CircleCI jobs.

## How to Contribute

We welcome [issues](https://github.com/apaxsoftware/dream-ops-orb/issues) to and [pull requests](https://github.com/apaxsoftware/dream-ops-orb/pulls) against this repository!

## How to Publish a Development Orb

As outlined in [CircleCI Orb Concepts](https://circleci.com/docs/2.0/orb-concepts/#development-orbs), you can publish devlopment orbs using the CLI. The version string must start with `dev:` followed by any string. A good convention is to use the feature branch in the name (eg. `apaxsoftware/dream-ops@dev:feature-branch`).

To validate your local orb:

```bash
circleci orb pack src | circleci orb validate -
```

And to publish a public orb that's unlisted in the registry and expires in 90 days:

```bash
circleci orb pack src | circleci orb publish - apaxsoftware/dream-ops@dev:feature-branch
```

## How to Publish An Update
1. Merge pull requests with desired changes to the main branch.
    - For the best experience, squash-and-merge and use [Conventional Commit Messages](https://conventionalcommits.org/).
2. Find the current version of the orb.
    - You can run `circleci orb info apaxsoftware/dream-ops | grep "Latest"` to see the current version.
3. Create a [new Release](https://github.com/apaxsoftware/dream-ops-orb/releases/new) on GitHub.
    - Click "Choose a tag" and _create_ a new [semantically versioned](http://semver.org/) tag. (ex: v1.0.0)
      - We will have an opportunity to change this before we publish if needed after the next step.
4.  Click _"+ Auto-generate release notes"_.
    - This will create a summary of all of the merged pull requests since the previous release.
    - If you have used _[Conventional Commit Messages](https://conventionalcommits.org/)_ it will be easy to determine what types of changes were made, allowing you to ensure the correct version tag is being published.
5. Now ensure the version tag selected is semantically accurate based on the changes included.
6. Click _"Publish Release"_.
    - This will push a new tag and trigger your publishing pipeline on CircleCI.