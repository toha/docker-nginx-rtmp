# docker-nginx-rtmp
Docker image with nginx based rtmp server

## Start container


```
docker run -d -p 1935:1935 datarhei/nginx-rtmp
```

which exposed the container on all interfaces on port 1935.

## Streaming-Example

* Send a stream:

 ```sh
ffmpeg -i input -c copy -f flv rtmp://localhost:1935/live/input
 ```
 
* Receive a stream:
 
 ```sh
ffmpeg -i rtmp://localhost:1935/live/input -c copy -f flv output
 ```

 Alternatively you can use [Open Broadcaster Software](https://obsproject.com/) to stream to the Server

 ## Config

 See [here](https://github.com/arut/nginx-rtmp-module/wiki/Getting-started-with-nginx-rtmp) for possible configurations.
