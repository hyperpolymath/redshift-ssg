;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — shift-ssg

(define-module (shift-ssg meta)
  #:export (architecture-decisions development-practices design-rationale))

(define architecture-decisions
  '((adr-001
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Satellite SSG project in the hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers" "Multi-platform CI")))
    (adr-002
     (title . "Deno Runtime for Adapters")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Need consistent runtime for 28 SSG adapters")
     (decision . "Use Deno as the primary runtime for adapter execution")
     (consequences . ("Modern JS/TS support" "Built-in security" "No node_modules" "Cross-platform")))
    (adr-003
     (title . "Adapter Interface Design")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Adapters need consistent interface across different SSGs")
     (decision . "Standard interface: name, language, description, connect, disconnect, isConnected, tools")
     (consequences . ("Consistent API" "Easy integration" "Tool discovery" "Connection management")))))

(define development-practices
  '((code-style
     (languages . ("JavaScript" "TypeScript"))
     (formatter . "deno fmt")
     (linter . "deno lint"))
    (security
     (sast . "CodeQL")
     (credentials . "env vars only")
     (dependencies . "Dependabot weekly"))
    (testing
     (framework . "Deno test")
     (coverage-minimum . 70))
    (versioning
     (scheme . "SemVer 2.0.0"))))

(define design-rationale
  '((why-rsr "RSR ensures consistency, security, and maintainability across the hyperpolymath ecosystem.")
    (why-adapters "Adapters provide a unified interface to diverse SSG tools without reimplementing them.")
    (why-satellite "Satellite architecture allows focused development while integrating with the poly-ssg-mcp hub.")))
