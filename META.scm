;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — shift-ssg

(define-module (shift-ssg meta)
  #:export (architecture-decisions development-practices design-rationale
            build-system documentation-metadata))

;; ═══════════════════════════════════════════════════════════════════════════════
;; ARCHITECTURE DECISIONS
;; ═══════════════════════════════════════════════════════════════════════════════

(define architecture-decisions
  '((adr-001
     ((title . "RSR Compliance")
      (status . "accepted")
      (date . "2025-12-15")
      (context . "Satellite SSG project in the hyperpolymath ecosystem")
      (decision . "Follow Rhodium Standard Repository guidelines")
      (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers" "Multi-platform CI"))))

    (adr-002
     ((title . "Deno Runtime for Adapters")
      (status . "accepted")
      (date . "2025-12-15")
      (context . "Need consistent runtime for 28 SSG adapters")
      (decision . "Use Deno as the primary runtime for adapter execution")
      (consequences . ("Modern JS/TS support" "Built-in security" "No node_modules" "Cross-platform"))))

    (adr-003
     ((title . "Adapter Interface Design")
      (status . "accepted")
      (date . "2025-12-15")
      (context . "Adapters need consistent interface across different SSGs")
      (decision . "Standard interface: name, language, description, connect, disconnect, isConnected, tools")
      (consequences . ("Consistent API" "Easy integration" "Tool discovery" "Connection management"))))

    (adr-004
     ((title . "Just + Must Build System")
      (status . "accepted")
      (date . "2025-12-22")
      (context . "Need flexible task runner with RSR compliance enforcement")
      (decision . "Use justfile for tasks, Mustfile for mandatory compliance checks")
      (consequences . ("Declarative recipes" "Compliance automation" "CI/CD integration" "Developer UX"))))

    (adr-005
     ((title . "Scheme Metadata Files")
      (status . "accepted")
      (date . "2025-12-22")
      (context . "Project metadata needs structured, readable format")
      (decision . "Use Scheme (.scm) files for STATE, META, ECOSYSTEM, PLAYBOOK, AGENTIC, NEUROSYM")
      (consequences . ("Structured data" "Machine readable" "Human readable" "Lisp ecosystem compatibility"))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; DEVELOPMENT PRACTICES
;; ═══════════════════════════════════════════════════════════════════════════════

(define development-practices
  '((code-style
     ((languages . ("JavaScript" "TypeScript"))
      (formatter . "deno fmt")
      (linter . "deno lint")
      (conventions . "Conventional Commits")))

    (security
     ((sast . "CodeQL")
      (secret-scanning . "Mustfile:must_security")
      (credentials . "env vars only")
      (dependencies . "Dependabot weekly")
      (actions . "SHA-pinned")))

    (testing
     ((framework . "Deno test")
      (coverage-minimum . 70)
      (categories . ("unit" "integration" "e2e"))))

    (versioning
     ((scheme . "SemVer 2.0.0")
      (changelog . "CHANGELOG.md")
      (tags . "vX.Y.Z format")))

    (branching
     ((main . "protected")
      (feature . "feat/<description>")
      (bugfix . "fix/<issue>-<description>")
      (docs . "docs/<description>")
      (security . "security/<description>")))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; BUILD SYSTEM
;; ═══════════════════════════════════════════════════════════════════════════════

(define build-system
  '((justfile
     ((location . "justfile")
      (commands
       ((core . ("check" "test" "test-unit" "test-integration" "test-e2e" "test-all"))
        (development . ("fmt" "lint" "typecheck" "dev"))
        (adapters . ("adapters-list" "adapter-check" "adapter-test"))
        (build . ("build" "release" "clean"))
        (security . ("audit" "deps-check" "coverage"))
        (docs . ("docs" "docs-serve"))
        (cicd . ("ci" "pre-commit" "pre-push"))
        (container . ("container-build" "container-run"))
        (mcp . ("mcp-start" "mcp-test"))
        (utility . ("status" "loc" "init" "sync-adapters"))
        (composite . ("setup" "qa" "prepare-release"))))))

    (mustfile
     ((location . "Mustfile")
      (commands
       ((build . ("must_build" "must_compile"))
        (test . ("must_test" "must_test_e2e"))
        (quality . ("must_lint" "must_security" "must_docs"))
        (adapters . ("must_adapters"))
        (cicd . ("must_ci" "must_pre_commit" "must_pre_push"))
        (utility . ("must_all" "must_help"))))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; DOCUMENTATION METADATA
;; ═══════════════════════════════════════════════════════════════════════════════

(define documentation-metadata
  '((files
     ((primary
       ((README.adoc . "Main project documentation")
        (SECURITY.md . "Security policy and vulnerability reporting")
        (CONTRIBUTING.md . "Contribution guidelines")
        (CODE_OF_CONDUCT.md . "Community standards")
        (cookbook.adoc . "Command recipes and workflows")))
      (metadata
       ((STATE.scm . "Project state and roadmap")
        (META.scm . "Architecture decisions and practices")
        (ECOSYSTEM.scm . "Ecosystem relationships")
        (PLAYBOOK.scm . "Operational runbooks")
        (AGENTIC.scm . "AI agent configuration")
        (NEUROSYM.scm . "Neuro-symbolic patterns")))))

    (formats
     ((asciidoc . ".adoc files for rich documentation")
      (markdown . ".md files for GitHub compatibility")
      (scheme . ".scm files for structured metadata")))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; DESIGN RATIONALE
;; ═══════════════════════════════════════════════════════════════════════════════

(define design-rationale
  '((why-rsr
     "RSR ensures consistency, security, and maintainability across the hyperpolymath ecosystem.
      It provides a clear standard for repository structure, security practices, and CI/CD.")

    (why-adapters
     "Adapters provide a unified interface to diverse SSG tools without reimplementing them.
      This allows users to work with any of 28 SSGs through a consistent API.")

    (why-satellite
     "Satellite architecture allows focused development while integrating with the poly-ssg-mcp hub.
      This enables both direct adapter usage and MCP protocol integration.")

    (why-scheme-metadata
     "Scheme provides a structured, readable format for project metadata that is both
      machine-parseable and human-readable, with strong Lisp ecosystem compatibility.")

    (why-just-must
     "Just provides flexible task automation for developers, while Mustfile enforces
      mandatory compliance checks. This separation ensures both productivity and quality.")))
