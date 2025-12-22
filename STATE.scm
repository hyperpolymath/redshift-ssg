;;; STATE.scm — shift-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "0.2.0")
    (updated . "2025-12-22")
    (project . "shift-ssg")
    (total-components . 44)
    (components-complete . 24)))

;; ═══════════════════════════════════════════════════════════════════════════════
;; PROJECT STATUS: 24/44 Components Complete (55%)
;; ═══════════════════════════════════════════════════════════════════════════════

(define component-status
  '(;; 1. Core Engine (2/4)
    (core-engine
     ((adapter-runtime
       ((location . "adapters/")
        (status . "complete")
        (description . "Deno-based adapter execution")))
      (adapter-interface
       ((location . "adapters/*.js")
        (status . "complete")
        (description . "Standard adapter API: connect, disconnect, tools")))
      (mcp-protocol
       ((location . "src/mcp/")
        (status . "pending")
        (description . "MCP protocol integration")))
      (adapter-registry
       ((location . "src/core/registry.ts")
        (status . "pending")
        (description . "Adapter loading and discovery")))))

    ;; 2. Build System (4/4)
    (build-system
     ((justfile
       ((location . "justfile")
        (status . "complete")
        (commands . ("build" "test" "test-e2e" "lint" "fmt" "ci"))))
      (mustfile
       ((location . "Mustfile")
        (status . "complete")
        (commands . ("build" "test" "lint" "security" "ci"))))
      (dependabot
       ((location . ".github/dependabot.yml")
        (status . "complete")
        (ecosystems . ("github-actions" "cargo" "mix" "npm" "pip" "nix"))))
      (asdf
       ((location . ".tool-versions")
        (status . "pending")
        (description . "Version management")))))

    ;; 3. Adapters (3/3) - 28 SSG adapters
    (adapters
     ((functional-adapters
       ((location . "adapters/")
        (status . "complete")
        (adapters . ("babashka" "coleslaw" "pollen" "frog" "perun" "cryogen"))))
      (typed-adapters
       ((location . "adapters/")
        (status . "complete")
        (adapters . ("cobalt" "mdbook" "fornax" "laika" "orchid" "zola"))))
      (ecosystem-adapters
       ((location . "adapters/")
        (status . "complete")
        (adapters . ("nimble-publisher" "serum" "tableau" "hakyll" "ema" "documenter" "franklin"))))))

    ;; 4. Security (5/5)
    (security
     ((security-policy
       ((location . "SECURITY.md")
        (status . "complete")
        (features . ("vulnerability-reporting" "safe-harbour" "disclosure-timeline"))))
      (codeql-scanning
       ((location . ".github/workflows/codeql.yml")
        (status . "complete")
        (languages . ("javascript-typescript"))))
      (dependabot-alerts
       ((location . ".github/dependabot.yml")
        (status . "complete")))
      (secret-scanning
       ((location . "Mustfile:must_security")
        (status . "complete")))
      (sha-pinned-actions
       ((location . ".github/workflows/")
        (status . "complete")
        (description . "All GitHub Actions SHA-pinned")))))

    ;; 5. Testing (1/4)
    (testing
     ((syntax-validation
       ((location . "justfile:check")
        (status . "complete")
        (description . "Node syntax check for all adapters")))
      (unit-tests
       ((location . "tests/unit/")
        (status . "pending")))
      (integration-tests
       ((location . "tests/integration/")
        (status . "pending")))
      (e2e-tests
       ((location . "tests/e2e/")
        (status . "pending")))))

    ;; 6. Documentation (5/8)
    (documentation
     ((readme
       ((location . "README.adoc")
        (status . "pending")
        (description . "Main project documentation")))
      (security-policy
       ((location . "SECURITY.md")
        (status . "complete")))
      (contributing-guide
       ((location . "CONTRIBUTING.md")
        (status . "complete")))
      (code-of-conduct
       ((location . "CODE_OF_CONDUCT.md")
        (status . "complete")))
      (cookbook
       ((location . "cookbook.adoc")
        (status . "complete")
        (sections . ("cli" "just" "must" "nickel" "hooks"))))
      (adapter-readme
       ((location . "adapters/README.md")
        (status . "complete")))
      (api-docs
       ((location . "docs/api/")
        (status . "pending")))
      (user-guide
       ((location . "docs/USER-GUIDE.adoc")
        (status . "pending")))))

    ;; 7. Configuration (2/3)
    (configuration
     ((git-config
       ((location . ".gitignore, .gitattributes")
        (status . "complete")))
      (github-config
       ((location . ".github/")
        (status . "complete")
        (includes . ("issue-templates" "workflows" "funding" "dependabot"))))
      (project-config
       ((location . "shift-ssg.config.json")
        (status . "pending")))))

    ;; 8. CI/CD (2/4)
    (cicd
     ((codeql-workflow
       ((location . ".github/workflows/codeql.yml")
        (status . "complete")))
      (ci-workflow
       ((location . ".github/workflows/ci.yml")
        (status . "pending")))
      (release-workflow
       ((location . ".github/workflows/release.yml")
        (status . "pending")))
      (hooks
       ((location . ".git/hooks/")
        (status . "pending")
        (hooks . ("pre-commit" "pre-push" "commit-msg"))))))))

(define current-position
  '((phase . "v0.2 - Build System & Documentation")
    (overall-completion . 55)
    (component-summary
     ((core-engine . "50%")
      (build-system . "100%")
      (adapters . "100%")
      (security . "100%")
      (testing . "25%")
      (documentation . "63%")
      (configuration . "67%")
      (cicd . "50%")))))

(define blockers-and-issues
  '((critical ())
    (high-priority
     (("CI workflow needs implementation" . "cicd")))
    (medium-priority
     (("README content needed" . "documentation")
      ("Unit tests needed" . "testing")))))

(define critical-next-actions
  '((immediate
     (("Create CI workflow" . high)
      ("Set up git hooks" . high)
      ("Add unit tests for adapters" . high)))
    (this-week
     (("Write README content" . medium)
      ("Create .tool-versions" . medium)
      ("Add API documentation" . medium)))
    (next-milestone
     (("Implement MCP protocol" . high)
      ("Create adapter registry" . high)
      ("Add E2E tests" . medium)))))

(define roadmap
  '((v0.1.0 "Initial Setup"
     ((status . "complete")
      (date . "2025-12-15")
      (features
       ("RSR-compliant repository structure" . complete)
       ("28 SSG adapters from poly-ssg-mcp" . complete)
       ("Security policies" . complete))))

    (v0.2.0 "Build System & Documentation"
     ((status . "in-progress")
      (target . "2025-Q1")
      (features
       ("Justfile with comprehensive recipes" . complete)
       ("Mustfile for RSR compliance" . complete)
       ("Cookbook documentation" . complete)
       ("CI/CD pipeline" . in-progress)
       ("Git hooks" . pending))))

    (v0.3.0 "Core Infrastructure"
     ((status . "planned")
      (target . "2025-Q2")
      (features
       ("Adapter loading and registry" . pending)
       ("MCP protocol integration" . pending)
       ("Configuration system" . pending)
       ("CLI interface" . pending))))

    (v0.4.0 "Testing & Quality"
     ((status . "planned")
      (target . "2025-Q3")
      (features
       ("Unit test suite" . pending)
       ("Integration tests" . pending)
       ("E2E tests" . pending)
       ("70% coverage target" . pending))))

    (v1.0.0 "Stable Release"
     ((status . "planned")
      (target . "2025-Q4")
      (features
       ("Production-ready release" . pending)
       ("Full documentation" . pending)
       ("Community feedback integration" . pending))))))

(define session-history
  '((snapshots
     ((date . "2025-12-15") (session . "initial") (notes . "SCM files added"))
     ((date . "2025-12-17") (session . "security-review") (notes . "Fixed template placeholders"))
     ((date . "2025-12-22") (session . "build-system") (notes . "Added justfile, mustfile, cookbook, 44-component structure")))))

(define state-summary
  '((project . "shift-ssg")
    (version . "0.2.0")
    (completion . "24/44 (55%)")
    (blockers . 0)
    (critical-blockers . 0)
    (updated . "2025-12-22")))
