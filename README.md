# 基本介绍

rails4快速开发产品原型的基础代码，结构清晰，注释详细，遵守rails约定规范，包含一些最基本的功能。可以[直接访问网站](http://121.42.161.252/)查看完整版。

## 方案

* Ruby管理：rbenv
* Ruby: Ruby 2.1.2
* 后端框架：Rails 4.2.0
* 前端框架：bootstrap 3 + jquery + coffeescript + scss
* API: grape + swagger + entity
* 数据库：MySQL
* 计划任务：whenever
* 备份：backup
* 文件上传：qiniu
* 编辑器：simditor
* 缓存：Memcached + redis
* 任务队列：sidekiq
* 服务器和站点监控：New relic + monit + god
* 部署：Capistrano3
* 邮件发送：sendcloud
* 反向代理：Nginx
* Web容器：unicorn
* 搜索：sunspot

## 功能组件

* 搜索系统，使用更强大的sunspot，支持中文分词和定位分析，sphinx(暂时不支持中文分词)停止使用。
* 资源上传，使用[七牛服务](http://www.qiniu.com/)。
* 发送邮件，使用[sendcloud服务](https://sendcloud.sohu.com/)。
* 系统监控，使用[newrelic](https://rpm.newrelic.com)。
* 用户系统，支持用户名邮箱登录，支持第三方(qq, weibo, github, douban, weixin)登录。
* 基本的运维配置，monit监控进程（邮件报警），whenever+backup自动备份，god监控。
* 基本的部署配置，capistrano自动一键部署。
* 修改了scaffold默认生成内容以适应bootstrap。
* 支持emoji表情包括输入法和英文输入。
* 系统消息。
* 各种文章基本操作，评论，赞，收藏等。
* 性能监控。


## 简单安装(运行在 Ubuntu 14.04 64位)

* 进入远程服务器将 `install_server_module_to_ubuntu` 中的脚本放入一个文件中。
* 运行命令 `chmod +x install_server_module_to_ubuntu` 使它变为可执行文件，并执行 `./install_server_module_to_ubuntu` 。
* 输入deploy密码， `exit` 并以deploy用户进入服务器。
* 同样执行 `./install_rails_module_to_deploy` 。
* 要使rbenv生效需要新开一个deploy控制台。
* 运行 `rbenv install 2.1.2` 。
* 运行 `rbenv global 2.1.2` 。
* 修改capistrano的ip地址。
* 
* 改变gem源: 

```
gem sources --remove https://rubygems.org/
gem sources -a https://ruby.taobao.org/
```
* 安装bundler `gem install bundler` 。
* 建立各种软链接(todo写入capistrano)。
* 修改nginx，unicorn配置文件。
* 本地执行 `cap production deploy` 。