
# fMRI pre-processing pipeline : Test phase


## How to get the Docker Image?

### From Docker Hub
[Link](https://hub.docker.com/repository/docker/salildock/fmripipe)
    `sudo docker pull salildock/fmripipe`
 ### Build Yourself
**Warning**:  It takes some time to build it yourself. Patience is a virtue.

    git clone https://github.com/salil-maastricht/fmripipe.git
    cd fmripipe
    sudo docker build -t user/image:tag

## How to run a container?
### Without GUI

    sudo docker run -ti salildock/fmripipe:testing /bin/bash
    
  ### With GUI

    xhost +
    sudo docker run -it -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix salildock/fmripipe:testing /bin/bash


## List of Software/Packages included

 - Matlab
 - SPM
 - fmriprep
 - dcm2niix
 - ITK-snap
 - MRtrix3
 - presurfer
 - bidscoin
 - heudiconv
 - neuropythy

**Note**: Matlab and Matlab-based software (like SPM) are all in `/opt`. For using Matlab-based software, please `addpath` in Matlab manually

## Wish List
I want:

 - This
 - That
 - That one too
Insert here the software/package/scripts you would like to be included and then send me a pull request with updated README
