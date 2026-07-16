// CI for the AURA Homebrew tap. Validates every formula the same way a user
// installs it: style, audit, install from the release binary, and run the
// formula's own test block — on both macOS and Linux.

def BUILD_SLUG = env.BUILD_TAG ? env.BUILD_TAG.replaceAll(/[^A-Za-z0-9_.-]/, '-') : 'homebrew-tap'

pipeline {
  agent none

  options {
    timeout time: 30, unit: 'MINUTES'
    timestamps()
    ansiColor 'xterm'
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '20'))
  }

  stages {
    stage('Test Formulae') {
      parallel {
        stage('macOS') {
          agent {
            node {
              label 'ec2-fleet-oss-macos'
              customWorkspace "/tmp/workspace/${BUILD_SLUG}-macos"
            }
          }
          steps { sh 'make test-mac' }
        }

        stage('Linux') {
          agent {
            node {
              label 'ec2-fleet-oss'
              customWorkspace "/tmp/workspace/${BUILD_SLUG}-linux"
            }
          }
          // Run inside the Homebrew image so the Linux test does not depend on
          // the agent having Linuxbrew installed.
          steps { sh 'make test-linux' }
        }
      }
    }
  }
}
