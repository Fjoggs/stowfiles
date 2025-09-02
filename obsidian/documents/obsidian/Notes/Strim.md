KeepassXC

Dropbox

Insync

chrome

OBS (obs-studio)

Nvidia driver

Delete old nginx (whereis nginx)

ssh

  

RMTP/nginx:

[nginx: download  
](https://nginx.org/en/download.html)https://nginx.org/en/docs/stream/ngx_stream_core_module.html

[https://github.com/sergey-dryabzhinsky/nginx-rtmp-module](https://github.com/sergey-dryabzhinsky/nginx-rtmp-module)

  

Sudo apt install libssl-dev

./configure --with-http_ssl_module --with-stream_ssl_module --with-stream  --add-module=/home/fjogen/opt/nginx-rtmp-module

Make

Sudo make install

  

https://serverfault.com/questions/1019317/receiving-rtmps-stream-on-nginx-rtmp/1019329#1019329

  

Sudo apt install python3-certbot-nginx

sudo certbot --nginx --nginx-server-root /usr/local/nginx/conf -d rtmps.sleeperop.com

  

Hvis black screen i OBS:

[@Superi](https://obsproject.com/forum/members/255802/) [@kmleon](https://obsproject.com/forum/members/148926/) If Google Chrome (or e.g. Brave) is your only problem, try to "Use system title bar and borders" over at the appearance settings chrome://settings/appearance

  

Firewall porter:

Ufw enable

Ufw allow 80

443

1935

1936

Ssh

  
  

# Cuda shit

  

1. [https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html)
    
2. [https://docs.nvidia.com/video-technologies/video-codec-sdk/12.0/ffmpeg-with-nvidia-gpu/index.html](https://docs.nvidia.com/video-technologies/video-codec-sdk/12.0/ffmpeg-with-nvidia-gpu/index.html)
    

3. Remember
    
4. export PATH=/usr/local/cuda-12.5/bin${PATH:+:${PATH}}
    
5. export LD_LIBRARY_PATH=/usr/local/cuda-12.5/lib64\
    
6.                       ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
    

7. ffmpeg -hwaccel cuda -i SampleVideo_1280x720_1mb.mp4 output.mp4
    

8. Kommandoen fungerte ikke før jeg kjørte ./deviceQuery fra cuda-samples
    
9. [https://github.com/nvidia/cuda-samples](https://github.com/nvidia/cuda-samples)
    
10. ~/opt/cuda-samples/bin/x86_64/linux/release/deviceQuery
    
11. Måtte kjøre den som sudo først for some reason
    
12. https://forums.developer.nvidia.com/t/cuda-10-2-on-linux-listing-devices-gives-error-999/113151/2