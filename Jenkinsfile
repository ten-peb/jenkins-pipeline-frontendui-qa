node("master"){
  def String stage_dir = '/data/staging/ui'
  def String ui_repo = 'git@github.com:tenna-llc/frontend-web.git'
  def String clone_to = 'ui'
  def String self_repo = 'git@github.com:ten-peb/jenkins-pipeline-frontendui-qa.git'
  def String self_clone_to = 'fe-qa' 
  stage("Init"){
    sh('rm -rf ' + clone_to) // remove cruft if exists
    sh('rm -rf ' + self_clone_to)
    doGitClone(ui_repo,clone_to,"develop")
    doGitClone(self_repo,self_clone_to)
    
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
          sh('find . -depth -print | cpio -pdmv ' + staging + '/');
      }
  } 
  stage("build image"){
     dir(self_clone_to + '/ui/ui' )
       sh ('cp -rp /data/staging/ui/* ./')
     }
     dir(self_clone_to + '/ui') { 
       sh('docker build -t ' + image_name + ':' + image_tag + ' .')
       sh('docker build -t ' + image_name + ':latest'  + ' .')
  }
  stage("Trigger Deployment") {
    build ('BuildDockerContainers')
    
  }
}