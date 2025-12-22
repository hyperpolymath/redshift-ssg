;;; PLAYBOOK.scm — shift-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;; Operational playbooks for shift-ssg development and maintenance

(define-module (shift-ssg playbook)
  #:export (playbooks runbooks workflows))

;; ═══════════════════════════════════════════════════════════════════════════════
;; DEVELOPMENT PLAYBOOKS
;; ═══════════════════════════════════════════════════════════════════════════════

(define playbooks
  '((development
     ((daily-workflow
       ((name . "Daily Development Workflow")
        (steps
         (("Pull latest changes" . "git pull origin main")
          ("Check project status" . "just status")
          ("Run syntax check" . "just check")
          ("Start development" . "just dev")))))

      (feature-development
       ((name . "Feature Development Workflow")
        (steps
         (("Create feature branch" . "git checkout -b feat/<name>")
          ("Implement feature" . "Edit adapters/ or src/")
          ("Format code" . "just fmt")
          ("Run lint" . "just lint")
          ("Run tests" . "just test")
          ("Commit changes" . "git commit -m 'feat: <description>'")
          ("Push for review" . "git push -u origin feat/<name>")))))

      (bug-fix
       ((name . "Bug Fix Workflow")
        (steps
         (("Create fix branch" . "git checkout -b fix/<issue-num>-<name>")
          ("Investigate issue" . "Review logs, reproduce")
          ("Implement fix" . "Edit relevant files")
          ("Add regression test" . "Add test to tests/")
          ("Run full test suite" . "just test-all")
          ("Commit fix" . "git commit -m 'fix: <description>'")
          ("Push for review" . "git push -u origin fix/<issue-num>-<name>")))))))

    (adapter-management
     ((add-new-adapter
       ((name . "Add New SSG Adapter")
        (steps
         (("Create adapter file" . "adapters/<name>.js")
          ("Implement interface" . "name, language, description, connect, disconnect, isConnected, tools")
          ("Add SPDX header" . "// SPDX-License-Identifier: MIT")
          ("Validate syntax" . "just adapter-check <name>")
          ("Test connection" . "just adapter-test <name>")
          ("Update adapter count" . "Update STATE.scm and ECOSYSTEM.scm")
          ("Document adapter" . "Add to adapters/README.md")))))

      (update-adapter
       ((name . "Update Existing Adapter")
        (steps
         (("Identify adapter" . "adapters/<name>.js")
          ("Make changes" . "Edit adapter implementation")
          ("Validate syntax" . "just adapter-check <name>")
          ("Run adapter tests" . "deno test tests/adapters/<name>_test.ts")
          ("Update documentation" . "If interface changed")))))

      (sync-from-hub
       ((name . "Sync Adapters from poly-ssg-mcp")
        (steps
         (("Run sync script" . "~/Documents/scripts/transfer-ssg-adapters.sh --satellite")
          ("Verify adapter count" . "ls -1 adapters/*.js | wc -l")
          ("Run syntax check" . "just check")
          ("Update STATE.scm" . "If new adapters added")
          ("Commit changes" . "git commit -m 'chore: sync adapters from hub'")))))))

    (release
     ((prepare-release
       ((name . "Prepare Release")
        (steps
         (("Update version" . "Edit STATE.scm metadata.version")
          ("Run full QA" . "just qa")
          ("Run E2E tests" . "just test-e2e")
          ("Generate docs" . "just docs")
          ("Update CHANGELOG" . "Document changes")
          ("Commit release prep" . "git commit -m 'chore: prepare release vX.Y.Z'")))))

      (publish-release
       ((name . "Publish Release")
        (steps
         (("Verify all checks pass" . "just ci")
          ("Create git tag" . "git tag vX.Y.Z")
          ("Push tag" . "git push origin vX.Y.Z")
          ("Create GitHub release" . "gh release create vX.Y.Z")
          ("Announce release" . "Update discussions/social")))))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; OPERATIONAL RUNBOOKS
;; ═══════════════════════════════════════════════════════════════════════════════

(define runbooks
  '((incident-response
     ((security-incident
       ((name . "Security Incident Response")
        (severity . "high")
        (steps
         (("Acknowledge incident" . "Within 48 hours")
          ("Assess severity" . "CVSS scoring")
          ("Create private advisory" . "GitHub Security Advisory")
          ("Develop fix" . "On security branch")
          ("Review fix" . "Security team review")
          ("Test fix" . "Comprehensive testing")
          ("Deploy fix" . "Release patch version")
          ("Disclose" . "After 90 days or fix available")))))

      (build-failure
       ((name . "CI Build Failure Response")
        (severity . "medium")
        (steps
         (("Identify failing check" . "Review GitHub Actions logs")
          ("Reproduce locally" . "just ci")
          ("Fix issue" . "Based on failure type")
          ("Verify fix" . "just ci")
          ("Push fix" . "To failing branch")))))

      (dependency-vulnerability
       ((name . "Dependency Vulnerability Response")
        (severity . "variable")
        (steps
         (("Review Dependabot alert" . "GitHub Security tab")
          ("Assess impact" . "Review affected code paths")
          ("Update dependency" . "If patch available")
          ("Test update" . "just test-all")
          ("Deploy update" . "Push to main")))))))

    (maintenance
     ((dependency-updates
       ((name . "Weekly Dependency Updates")
        (frequency . "weekly")
        (steps
         (("Review Dependabot PRs" . "GitHub Pull Requests")
          ("Test updates locally" . "just test-all")
          ("Merge safe updates" . "Auto-merge patch versions")
          ("Review major updates" . "Manual review required")))))

      (adapter-health-check
       ((name . "Adapter Health Check")
        (frequency . "monthly")
        (steps
         (("Run syntax check" . "just check")
          ("Validate all adapters" . "bash Mustfile adapters")
          ("Check for deprecated tools" . "Review adapter tool versions")
          ("Update if needed" . "Sync from hub")))))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; AUTOMATED WORKFLOWS
;; ═══════════════════════════════════════════════════════════════════════════════

(define workflows
  '((ci-cd
     ((on-push
       ((triggers . ("push to main" "push to feature branches"))
        (actions
         (("syntax-check" . "just check")
          ("lint" . "just lint")
          ("test" . "just test")
          ("security-scan" . "CodeQL analysis")))))

      (on-pull-request
       ((triggers . ("PR to main"))
        (actions
         (("syntax-check" . "just check")
          ("lint" . "just lint")
          ("test" . "just test")
          ("coverage-check" . "just coverage")
          ("security-scan" . "CodeQL analysis")))))

      (on-release
       ((triggers . ("tag push vX.Y.Z"))
        (actions
         (("full-test" . "just test-all")
          ("build" . "just build")
          ("docs" . "just docs")
          ("publish" . "GitHub release")))))))

    (scheduled
     ((weekly-security
       ((schedule . "Sundays 20:42 UTC")
        (actions
         (("codeql-scan" . "Full repository scan")
          ("dependabot-check" . "Review open PRs")))))

      (monthly-maintenance
       ((schedule . "First Monday of month")
        (actions
         (("adapter-health" . "Validate all adapters")
          ("documentation-review" . "Check for outdated docs")
          ("performance-check" . "Review any regressions")))))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; ESCALATION PATHS
;; ═══════════════════════════════════════════════════════════════════════════════

(define escalation
  '((severity-levels
     ((critical
       ((response-time . "4 hours")
        (examples . ("RCE vulnerability" "Data breach" "Complete service outage"))
        (escalation . "Immediate maintainer notification")))
      (high
       ((response-time . "24 hours")
        (examples . ("Auth bypass" "XSS" "Significant functionality broken"))
        (escalation . "Next business day")))
      (medium
       ((response-time . "72 hours")
        (examples . ("Minor vulnerability" "Non-critical bug"))
        (escalation . "Within week")))
      (low
       ((response-time . "7 days")
        (examples . ("Enhancement request" "Documentation issue"))
        (escalation . "Best effort")))))))
