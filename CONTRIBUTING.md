# Contributing to Shift SSG

Thank you for your interest in contributing to Shift SSG! This document provides guidelines and information for contributors.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Development Workflow](#development-workflow)

---

## Code of Conduct

This project follows the [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

---

## Getting Started

### Prerequisites

- Git
- Deno (for running adapters)
- Node.js (optional, for npm ecosystem tools)

### Setup

```bash
# Clone the repository
git clone https://github.com/hyperpolymath/shift-ssg.git
cd shift-ssg

# Using Nix (recommended for reproducibility)
nix develop

# Or using toolbox/distrobox
toolbox create shift-ssg-dev
toolbox enter shift-ssg-dev
# Install dependencies manually

# Verify setup
just check   # or: cargo check / mix compile / etc.
just test    # Run test suite
```

### Repository Structure
```
shift-ssg/
├── adapters/            # SSG adapter implementations
├── docs/                # Documentation
├── .github/             # GitHub config
│   ├── ISSUE_TEMPLATE/
│   └── workflows/
├── CHANGELOG.md
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md      # This file
├── LICENSE.txt
├── README.adoc
├── SECURITY.md
├── META.scm             # Architecture metadata
├── STATE.scm            # Project state tracking
└── ECOSYSTEM.scm        # Ecosystem relationships
```

---

## How to Contribute

### Reporting Bugs

**Before reporting**:
1. Search existing issues
2. Check if it's already fixed in `main`
3. Determine which component the bug affects

**When reporting**:

Use the [bug report template](.github/ISSUE_TEMPLATE/bug_report.md) and include:

- Clear, descriptive title
- Environment details (OS, versions, toolchain)
- Steps to reproduce
- Expected vs actual behaviour
- Logs, screenshots, or minimal reproduction

### Suggesting Features

**Before suggesting**:
1. Search existing issues and discussions
2. Consider how the feature fits with the project

**When suggesting**:

Use the [feature request template](.github/ISSUE_TEMPLATE/feature_request.md) and include:

- Problem statement (what pain point does this solve?)
- Proposed solution
- Alternatives considered

### Your First Contribution

Look for issues labelled:

- [`good first issue`](https://github.com/hyperpolymath/shift-ssg/labels/good%20first%20issue) — Simple tasks
- [`help wanted`](https://github.com/hyperpolymath/shift-ssg/labels/help%20wanted) — Community help needed
- [`documentation`](https://github.com/hyperpolymath/shift-ssg/labels/documentation) — Docs improvements

---

## Development Workflow

### Branch Naming
```
docs/short-description       # Documentation
test/what-added              # Test additions
feat/short-description       # New features
fix/issue-number-description # Bug fixes
refactor/what-changed        # Code improvements
security/what-fixed          # Security fixes
```

### Commit Messages

We follow [Conventional Commits](https://www.conventionalcommits.org/):
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types**: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `security`

### Pull Request Process

1. Fork the repository
2. Create your feature branch (`git checkout -b feat/amazing-feature`)
3. Make your changes
4. Ensure tests pass
5. Commit your changes using conventional commits
6. Push to your branch (`git push origin feat/amazing-feature`)
7. Open a Pull Request

---

## Questions?

- Open a [Discussion](https://github.com/hyperpolymath/shift-ssg/discussions)
- Check the [README](README.adoc)

---

<sub>Last updated: 2025</sub>
