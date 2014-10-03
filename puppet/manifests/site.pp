include baseconfig
include accounts
include sandbox

docker::image { 'ubuntu':
  image_tag => '14.04'
}
