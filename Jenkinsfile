pipeline {
    agent any
    stages {
        stage('Init') {
            steps {
                echo 'Building...'
                telegramSend(message: 'Building Proxy...', chatId: -4049162919)
            }
        }
        stage ('Deployments') {
            steps {
                echo 'Deploying to Production environment...'
                echo 'Copy project over SSH...'
                sshPublisher(publishers: [
                    sshPublisherDesc(
                        configName: 'nhanhoa232',
                        transfers:
                            [sshTransfer(
                                cleanRemote: false,
                                excludes: '',
                                execCommand: "docker build -t proxy232 ./thinklabsdev/proxy232CI/ --no-cache \
                                    && docker service rm proxy_nhanhoa232 || true \
                                    && docker stack deploy -c ./thinklabsdev/proxy232CI/docker-compose.yml proxy \
                                    && rm -rf ./thinklabsdev/proxy232CIB \
                                    && mv ./thinklabsdev/proxy232CI/ ./thinklabsdev/proxy232CIB",
                                execTimeout: 1200000,
                                flatten: false,
                                makeEmptyDirs: false,
                                noDefaultExcludes: false,
                                patternSeparator: '[, ]+',
                                remoteDirectory: './thinklabsdev/proxy232CI',
                                remoteDirectorySDF: false,
                                removePrefix: '',
                                sourceFiles: '*, ssl/, conf.d/'
                            )],
                        usePromotionTimestamp: false,
                        useWorkspaceInPromotion: false,
                        verbose: false
                    )
                ])
                telegramSend(message: 'Build Proxy - STATUS: $BUILD_STATUS!', chatId: -4049162919)
            }
        }
    }
}