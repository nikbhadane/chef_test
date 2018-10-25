#!/usr/bin/env groovy

node('master') {
    // jerbs from jerbs
    def jerbs = fileLoader.fromGit('tttest',
        'https://github.com/nikbhadane/hellowordapp.git', 'master', null, '')

    jerbs.all_the_jerbs()
}
