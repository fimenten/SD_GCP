FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

RUN apt update && apt upgrade -y
RUN apt install -y python3-pip

RUN pip install torch torchvision torchtext torchaudio torchdata --extra-index-url https://download.pytorch.org/whl/cu118
RUN git clone https://github.com/camenduru/stable-diffusion-webui
WORKDIR  /stable-diffusion-webui

# "Download anything"
RUN wget https://huggingface.co/ckpt/anything-v4.5-vae-swapped/resolve/main/anything-v4.5-vae-swapped.safetensors -O models/Stable-diffusion/anything-v4.5-vae-swapped.safetensors
RUN wget https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.ckpt -O models/Stable-diffusion/anything-v4.5-pruned.ckpt
RUN wget https://huggingface.co/ckpt/BraV4/resolve/main/BraV4.safetensors -O models/Stable-diffusion/BraV4.safetensors

# "Download extensions"
RUN git clone -b v1.6 https://github.com/camenduru/deforum-for-automatic1111-webui extensions/deforum-for-automatic1111-webui
RUN git clone -b v1.6 https://github.com/camenduru/stable-diffusion-webui-images-browser extensions/stable-diffusion-webui-images-browser
RUN git clone -b v1.6 https://github.com/camenduru/stable-diffusion-webui-huggingface extensions/stable-diffusion-webui-huggingface
RUN git clone -b v1.6 https://github.com/camenduru/sd-civitai-browser extensions/sd-civitai-browser
RUN git clone -b v1.6 https://github.com/camenduru/sd-webui-additional-networks extensions/sd-webu


