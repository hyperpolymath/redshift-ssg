;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — shift-ssg

(define-module (shift-ssg ecosystem)
  #:export (ecosystem-info related-projects adapters integration))

;; ═══════════════════════════════════════════════════════════════════════════════
;; ECOSYSTEM INFORMATION
;; ═══════════════════════════════════════════════════════════════════════════════

(define ecosystem-info
  '((version . "1.0.0")
    (name . "shift-ssg")
    (type . "satellite-ssg")
    (license . "AGPL-3.0-or-later")
    (purpose . "Satellite SSG implementation providing direct adapter access for static site generation")

    (position-in-ecosystem
     "Shift SSG is a satellite implementation in the hyperpolymath ecosystem.
      It provides direct access to 28 SSG adapters for static site generation.
      Follows RSR (Rhodium Standard Repository) guidelines for compliance.
      Integrates with the poly-ssg-mcp hub for MCP protocol support.")

    (what-this-is
     ("Provides 28 SSG adapters for various programming languages"
      "Integrates with the poly-ssg-mcp hub ecosystem"
      "Follows RSR compliance for security and maintainability"
      "Supports Deno runtime for adapter execution"
      "Offers comprehensive build system with just+must"
      "Includes operational playbooks and AI agent configuration"))

    (what-this-is-not
     ("NOT a standalone SSG (uses existing SSG tools via adapters)"
      "NOT a replacement for poly-ssg-mcp (complements it)"
      "NOT exempt from RSR compliance requirements"
      "NOT a monolithic application (distributed adapter architecture)"))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; RELATED PROJECTS
;; ═══════════════════════════════════════════════════════════════════════════════

(define related-projects
  '((hub
     ((name . "poly-ssg-mcp")
      (url . "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship . "hub")
      (description . "Unified MCP server for 28 SSGs - provides adapter interface")
      (sync-command . "~/Documents/scripts/transfer-ssg-adapters.sh --satellite")
      (differentiation
       "poly-ssg-mcp = Hub with all SSG adapters via MCP protocol
        shift-ssg = Satellite implementation for direct adapter usage")))

    (standard
     ((name . "rhodium-standard-repositories")
      (url . "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship . "standard")
      (description . "RSR compliance baseline for repository structure and security")
      (compliance-level . "Gold")))

    (ecosystem-projects
     ((hyperpolymath
       ((description . "Parent organization for all related projects")
        (includes . ("poly-ssg-mcp" "rhodium-standard-repositories" "shift-ssg"))))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; ADAPTERS
;; ═══════════════════════════════════════════════════════════════════════════════

(define adapters
  '((count . 28)
    (location . "adapters/")
    (runtime . "Deno")

    (interface
     ((exports . ("name" "language" "description" "connect" "disconnect" "isConnected" "tools"))
      (tool-schema . "MCP tool definition format")))

    (by-category
     ((functional
       ((adapters . ("babashka" "coleslaw" "pollen" "frog" "perun" "cryogen"))
        (languages . ("Clojure" "Common Lisp" "Racket"))
        (paradigm . "Lisp/functional")))

      (statically-typed
       ((adapters . ("cobalt" "mdbook" "fornax" "laika" "orchid" "zola"))
        (languages . ("Rust" "F#" "Scala" "Kotlin"))
        (paradigm . "Statically-typed systems")))

      (elixir-ecosystem
       ((adapters . ("nimble-publisher" "serum" "tableau"))
        (languages . ("Elixir"))
        (paradigm . "BEAM/OTP concurrent")))

      (scientific
       ((adapters . ("documenter" "franklin" "ema" "hakyll"))
        (languages . ("Julia" "Haskell"))
        (paradigm . "Functional/scientific")))

      (other
       ((adapters . ("marmot" "nimrod" "publish" "reggae" "scalatex"
                     "staticwebpages" "wub" "yocaml" "zotonic"))
        (languages . ("Crystal" "Nim" "Swift" "D" "Scala" "Julia" "Tcl" "OCaml" "Erlang"))))))

    (by-language
     ((Rust . ("cobalt" "mdbook" "zola"))
      (Haskell . ("ema" "hakyll"))
      (Elixir . ("nimble-publisher" "serum" "tableau"))
      (Julia . ("documenter" "franklin" "staticwebpages"))
      (Clojure . ("babashka" "cryogen" "perun"))
      (Racket . ("frog" "pollen"))
      (OCaml . ("yocaml"))
      (F# . ("fornax"))
      (Scala . ("laika" "scalatex"))
      (Kotlin . ("orchid"))
      (Nim . ("nimrod"))
      (Erlang . ("zotonic"))
      (D . ("reggae"))
      (Swift . ("publish"))
      (Tcl . ("wub"))
      (Common-Lisp . ("coleslaw"))
      (Crystal . ("marmot"))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; INTEGRATION
;; ═══════════════════════════════════════════════════════════════════════════════

(define integration
  '((mcp-protocol
     ((status . "planned")
      (server . "src/mcp/server.ts")
      (tools . ("adapter-list" "adapter-info" "adapter-connect" "adapter-invoke"))))

    (build-system
     ((justfile . "Primary task runner")
      (mustfile . "RSR compliance enforcement")))

    (ci-cd
     ((workflows . ("codeql.yml" "ci.yml"))
      (dependabot . "Weekly dependency updates")
      (security . "SHA-pinned actions")))

    (documentation
     ((primary . ("README.adoc" "cookbook.adoc"))
      (metadata . ("STATE.scm" "META.scm" "ECOSYSTEM.scm"
                   "PLAYBOOK.scm" "AGENTIC.scm" "NEUROSYM.scm"))))))
