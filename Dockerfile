FROM mathworks/matlab
MAINTAINER Salil Bhat <salil.bhat@salil.bhat@maastrichtuniversity.nl>
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                    python3.8 \
					python3-pip \
                    dcm2niix \
                    unzip \
                    wget \
                    default-jre \
                    xorg \
                    openbox \
                    itksnap \
                    git \
                    g++ \
                    python3-numpy \
                    libeigen3-dev \
                    zlib1g-dev \
                    libgl1-mesa-dev \
                    libfftw3-dev \
                    libtiff5-dev \
                    libqt5opengl5-dev
#fmriprep

RUN python -m pip install fmriprep

#neurpythy

RUN python -m pip install neuropythy

#SPM

WORKDIR /opt

ENV SPM_VERSION 12
ENV SPM_REVISION r7771

RUN wget "https://www.fil.ion.ucl.ac.uk/spm/download/restricted/eldorado/spm"$SPM_VERSION".zip"

RUN wget "http://www.fil.ion.ucl.ac.uk/spm/download/spm12_updates/spm12_updates_"$SPM_REVISION".zip"

RUN unzip "spm"$SPM_VERSION".zip"
RUN unzip -o "spm"$SPM_VERSION"_updates_"$SPM_REVISION".zip" -d "spm"$SPM_VERSION""

RUN rm ./*.zip

#Mtrix3
RUN apt install -y --no-install-recommends libqt5svg5-dev
RUN git clone https://github.com/MRtrix3/mrtrix3.git
WORKDIR /opt/mrtrix3
RUN ./configure
RUN ./build
RUN ./set_path

WORKDIR /opt

#presurfer
RUN git clone https://github.com/srikash/presurfer.git

#bidscoin
RUN python -m pip install bidscoin
#heudiconv
RUN python -m pip install heudiconv
