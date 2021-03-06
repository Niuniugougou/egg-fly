<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content="{{ lay.base.keywords }}">
<meta name="description" content="{{ lay.base.description }}">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>{{ lay.base.title }}</title>
{% include '../common/link.tpl' %}
</head>
<body>

{% include '../common/header.tpl' %}

<div class="layui-container fly-marginTop fly-user-main">

  {% include '../common/user-nav.tpl' %}

  <div class="fly-panel fly-panel-user pad20">
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title" id="LAY_mine">
        <li class="layui-this" lay-id="info">我的资料</li>
        <li lay-id="avatar">头像</li>
        {% if user.type != 'qq' %}<li lay-id="pass">密码</li>{% endif %}
        <li lay-id="bind">帐号绑定</li>
      </ul>
      <div class="layui-tab-content" style="padding: 20px;">
        <div class="layui-form layui-form-pane layui-tab-item layui-show">
          <form method="post">
            <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">昵称</label>
              <div class="layui-input-inline">
                <input type="text" disabled id="L_username" name="username" required lay-verify="required" autocomplete="off" value="{{ user.username }}" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item layui-form-text">
              <label for="L_sign" class="layui-form-label">签名</label>
              <div class="layui-input-block">
                <textarea placeholder="随便写些什么刷下存在感" id="L_sign"  name="sign" autocomplete="off" class="layui-textarea" style="height: 80px;">{{ user.sign}}</textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>确认修改</button>
            </div>
          </div>
          
          <div class="layui-form layui-form-pane layui-tab-item">
            <div class="layui-form-item">
              <div class="avatar-add">
                <p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
               
                {% if user.type == 'qq'%}
                    <img src="{{ user.pic }}" title="{{ user.username }}">
                {% else %}
                  <button type="button" class="layui-btn upload-img">
                    <i class="layui-icon">&#xe67c;</i>上传头像
                  </button>
                  <img src="{{  BaseUrl.CDN }}{{ user.pic }}" title="{{ user.username }}">
                {% endif %}
                <span class="loading"></span>
              </div>
            </div>
          </div>
          {% if user.type != 'qq' %}
          <div class="layui-form layui-form-pane layui-tab-item">
            <form action="/user/repass" method="post">
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="pass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
              </div>
              <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>确认修改</button>
              </div>
            </form>
          </div>
          {% endif %}
          
          <div class="layui-form layui-form-pane layui-tab-item">
            <ul class="app-bind">
              <li class="fly-msg">
                <i class="iconfont icon-qq"></i>
                {% if user.openid %}
                <span>已成功绑定，您可以使用QQ帐号直接登录Fly社区</span>
                {# <a href="javascript:;" class="acc-unbind" type="qq_id">解除绑定</a> #}
                 {% else %}
                 <a href="/app/qq" onclick="layer.msg('正在绑定QQ', {icon:16, shade: 0.1, time:0})" class="acc-bind" type="qq_id">立即绑定</a>
                 <span>，即可使用QQ帐号登录Fly社区</span>
                 {% endif %}
              </li>
            </ul>
          </div>
        </div>

      </div>
    </div>
  </div>

</div>

{% include '../common/footer.tpl' %}

</body>
</html>