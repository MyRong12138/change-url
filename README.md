# change-url
自定义kong插件，更改的URL主要用来实现批量匹配，插件将会将在用户请求的URL路径加上服务路径，然后再转发到上游服务器。
# 使用插件
进入/usr/local/share/lua/5.1/kong，找到constants.lua文件，在文件上添加自定义插件名change-url，然后就可以通过名称直接添加了，无任何参数
# 插件使用说明
1,假如您配置了一个上游服务器，如：192.168.x.x:xx,并且您不想给每一个service配置一个route，您可以只配置一个service.<br>
2,假设service上游为192.168.x.x:xx,path为/test/v1,route配置请求规则是路径为/login<br>
3,那么当用户发起一个http ://127.0.0.1:8000/login的请求将会被转发到http ://192.168.x.x:xx/test/v1/login.<br>
4,后续所有对此上游的请求也只需要配置route，而无需再配置service.<br>
# 插件的特殊用法
您还可以只配置一个service为http ://x.x.x.x:8000/,然后配置route，paths为/test.*<br>
那么所有的请求只要带有test都将被转发到http ://x.x.x.x:8000/test/（任意地址）。<br>
# 插件更新
## v2
添加了屏蔽字段config.ignore_addr，用户提交的请求url将会从此字段后面开始截取有效部分与service上游路径拼接
