node("master"){
  def String stage_dir = '/data/staging/ui'
  def String ui_repo = 'git@github.com:tenna-llc/frontend-web.git'
  def String clone_to = 'few'
  def String self_repo = 'git@github.com:ten-peb/jenkins-pipeline-frontendui-qa.git'
  def String self_clone_to = 'ui-pipeline'
  def String image_name = 'tenna-ui'
  def String image_tag  = '0.5.0'
  stage("Init"){
    sh('rm -rf ' + self_clone_to)
    doGitClone(self_repo,self_clone_to)
    dir(self_clone_to + '/ui'){
      sh('rm -rf ' + clone_to) // remove cruft if exists
      doGitClone(ui_repo,clone_to,"develop")
    }
    dir(self_clone_to) {
      sh('tree .')
    }
  }
  stage("build image"){
     dir(self_clone_to + '/' + clone_to ) { 
       sh('docker build -t ' + image_name + ':' + image_tag + ' .')
       sh('docker build -t ' + image_name + ':latest'  + ' .')
     }
  }
  stage("Trigger Deployment") {
    build ('BuildDockerContainers')
    
  }
}