node("master"){
  def String stage_dir = '/data/staging/ui'
  def String ui_repo = 'git@github.com:tenna-llc/frontend-web.git'
  def String clone_to = 'ui' 
  stage("Init"){
    sh('rm -rf ' + clone_to) // remove cruft if exists
    doGitClone(ui_repo,clone_to)
  }
  stage("build"){
    def String env_stuff = '''
BASE_URL=http://localhost:3000/api
GOOGLE_API_KEY=AIzaSyAL0MuUIdL72AekYnnAYA9PGzbAPMXfcyE
GOOGLE_MAP_CHANNEL=4.0
ASSET_API=http://192.168.10.109:1998
SITE_API=http://192.168.10.109:1998"
'''

    dir(clone_to){
      sh('npm install')
      // create our env file 
      writeFile(file: '.env',text: env_stuff)
      sh('sed -e \'102i     host: "0.0.0.0",\' -i webpack.config.js')
    }
  }
  stage("Stage Files"){
      def String staging = '/data/staging/ui/'
      dir(clone_to){
        sh('rm -rf ' + staging + '*')
        sh('mkdir -vp ' + staging + 'public')
        sh('cp -rp node_modules ' + staging + '/')
        sh('cp -rp src ' + staging + '/')
        sh('cp -rp src/index.html ' + staging + 'public' + '/');
        sh('cp server.js ' + staging)

      }
  }
  stage("Trigger Deployment") {
    build ('BuildDockerContainers')
    
  }
}