﻿<%@ Page Language="C#" Inherits="SS.Form.Pages.PageSettings" %>
  <%@ Register TagPrefix="ctrl" Namespace="SS.Form.Controls" Assembly="SS.Form" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="utf-8">
      <link href="assets/plugin-utils/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
      <link href="assets/plugin-utils/css/plugin-utils.css" rel="stylesheet" type="text/css" />
      <link href="assets/plugin-utils/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
      <link href="assets/plugin-utils/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    </head>

    <body>

      <form runat="server">

        <header id="topnav">
          <div class="navbar-custom">
            <div class="container">
              <div id="navigation">
                <ul class="navigation-menu">
                  <li class="has-submenu">
                    <a href="<%=PageLogsUrl%>">
                      <i class="ion-compose"></i>
                      数据列表
                    </a>
                  </li>
                  <li class="has-submenu">
                    <a href="<%=PageResultsUrl%>">
                      <i class="ion-compose"></i>
                      数据统计
                    </a>
                  </li>
                  <li class="has-submenu">
                    <a href="<%=PageFieldsUrl%>">
                      <i class="ion-compose"></i>
                      字段管理
                    </a>
                  </li>
                  <li class="has-submenu active">
                    <a href="<%=PageSettingsUrl%>">
                      <i class="ion-compose"></i>
                      选项设置
                    </a>
                  </li>
                  <li class="has-submenu">
                    <asp:LinkButton id="LbTemplate" onclick="LbTemplate_Click" runat="server">
                      <i class="ion-compose"></i>
                      自定义模板
                    </asp:LinkButton>
                  </li>
                  <li class="has-submenu">
                    <a href="<%=ReturnUrl%>">
                      <i class="ion-ios-undo"></i>
                      返回列表
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </header>

        <!-- container start -->
        <div class="container" style="margin-top: 70px;">
          <div class="m-b-25"></div>
          <div class="row">
            <div class="col-sm-12">
              <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">表单选项设置</h4>
                <p class="text-muted m-b-25 font-13">在此设置表单以及选项信息</p>
                <asp:Literal id="LtlMessage" runat="server" />

                <div class="row">
                  <div class="form-horizontal" role="form">
                    <div class="form-group">
                      <label class="col-md-2 control-label">标题</label>
                      <div class="col-md-5">
                        <asp:TextBox class="form-control" Columns="25" MaxLength="50" id="TbTitle" runat="server" />
                      </div>
                      <div class="col-md-5">
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="TbTitle" ValidationExpression="[^']+" errorMessage=" *"
                          foreColor="red" display="Dynamic" />
                      </div>
                    </div>
  
                    <div class="form-group">
                      <label class="col-md-2 control-label">简介</label>
                      <div class="col-md-5">
                        <asp:TextBox class="form-control" Columns="25" TextMode="MultiLine" Rows="3" MaxLength="50" id="TbDescription" runat="server" />
                      </div>
                      <div class="col-md-5">
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="TbDescription" ValidationExpression="[^']+" errorMessage=" *"
                          foreColor="red" display="Dynamic" />
                      </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-2 control-label">默认样式</label>
                        <div class="col-md-5">
                          <asp:DropDownList class="form-control" id="DdlDefaultTheme" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col-md-5">
                          
                        </div>
                      </div>
                    
                    <div class="form-group">
                      <label class="col-md-2 control-label">限制时间</label>
                      <div class="col-md-10">
                        <div class="checkbox checkbox-primary">
                          <asp:CheckBox ID="CbIsTimeout" OnCheckedChanged="CbIsTimeout_CheckedChanged" AutoPostBack="true" text="表单只允许在规定的时间范围内访问" runat="server"></asp:CheckBox>
                        </div>
                      </div>
                    </div>
                    <asp:PlaceHolder id="PhTimeout" runat="server">

                      <div class="form-group">
                        <label class="col-md-2 control-label" for="maxNum">开始时间</label>
                        <div class="col-md-3">
                          <ctrl:DateTimeTextBox ID="TbTimeToStart" class="form-control" Columns="40" runat="server"></ctrl:DateTimeTextBox>
                          <asp:RequiredFieldValidator ControlToValidate="TbTimeToStart" errorMessage=" *" foreColor="red" display="Dynamic" runat="server"
                          />
                        </div>
                        <span class="col-md-7">&nbsp;</span>
                      </div>
                      <div class="form-group">
                        <label class="col-md-2 control-label" for="maxNum">结束时间</label>
                        <div class="col-md-3">
                          <ctrl:DateTimeTextBox ID="TbTimeToEnd" class="form-control" Columns="40" runat="server"></ctrl:DateTimeTextBox>
                          <asp:RequiredFieldValidator ControlToValidate="TbTimeToEnd" errorMessage=" *" foreColor="red" display="Dynamic" runat="server"
                          />
                        </div>
                        <span class="col-md-7">&nbsp;</span>
                      </div>

                    </asp:PlaceHolder>

                    <div class="form-group">
                      <label class="col-md-2 control-label">验证码</label>
                      <div class="col-md-10">
                        <div class="checkbox checkbox-primary">
                          <asp:CheckBox ID="CbIsCaptcha" text="显示验证码" runat="server"></asp:CheckBox>
                        </div>
                      </div>
                    </div>

                    <asp:PlaceHolder id="PhSmsPluginNotInstalled" visible="false" runat="server">
                      <div class="form-group">
                        <label class="col-md-2 control-label">向管理员发送短信通知</label>
                        <div class="col-md-3">
                          短信插件SS.SMS未安装
                        </div>
                        <div class="col-md-7 help-block">
                          启用短信功能需要安装SS.SMS 短信插件
                        </div>
                      </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder id="PhSms" visible="false" runat="server">
                      <div class="form-group">
                        <label class="col-md-2 control-label">向管理员发送短信通知</label>
                        <div class="col-md-3">
                          <asp:DropDownList class="form-control" id="DdlIsAdministratorSmsNotify" AutoPostBack="true" OnSelectedIndexChanged="DdlIsAdministratorSmsNotify_SelectedIndexChanged"
                            runat="server">
                            <asp:ListItem Text="发送短信通知" Value="True" Selected="true"></asp:ListItem>
                            <asp:ListItem Text="不发送" Value="False"></asp:ListItem>
                          </asp:DropDownList>
                        </div>
                        <div class="col-md-7 help-block">
                          启用短信发送后将自动为每一条新增提交发送短信给指定手机
                        </div>
                      </div>
                      <asp:PlaceHolder id="PhIsAdministratorSmsNotify" runat="server">
                        <div class="form-group">
                          <label class="col-md-2 control-label">发送通知短信模板Id</label>
                          <div class="col-md-3">
                            <asp:TextBox class="form-control" ID="TbAdministratorSmsNotifyTplId" runat="server"></asp:TextBox>
                          </div>
                          <div class="col-md-7 help-block">
                            <asp:RequiredFieldValidator ControlToValidate="TbAdministratorSmsNotifyTplId" runat="server" ErrorMessage="*" foreColor="Red"></asp:RequiredFieldValidator>
                            需进入短信供应商模板管理界面，添加通知类短信模板并获取模板Id
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-md-2 control-label">短信模板包含变量</label>
                          <div class="col-md-3">
                            <asp:ListBox ID="LbAdministratorSmsNotifyKeys" SelectionMode="Multiple" class="form-control" runat="server"></asp:ListBox>
                          </div>
                          <div class="col-md-7 help-block">
                            请勾选短信模板文字中包含的变量，请确保变量名大小写一致
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-md-2 control-label">管理员接受短信通知手机号</label>
                          <div class="col-md-3">
                            <asp:TextBox class="form-control" ID="TbAdministratorSmsNotifyMobile" runat="server" />
                          </div>
                          <div class="col-md-7">
                            <asp:RequiredFieldValidator ControlToValidate="TbAdministratorSmsNotifyMobile" ErrorMessage=" *" ForeColor="red" Display="Dynamic"
                              runat="server" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="TbAdministratorSmsNotifyMobile" ValidationExpression="[^']+"
                              ErrorMessage=" *" ForeColor="red" Display="Dynamic" />
                          </div>
                        </div>
                      </asp:PlaceHolder>
                    </asp:PlaceHolder>

                    <div class="m-b-25"></div>
                    <div class="form-group m-b-0">
                      <div class="col-sm-offset-2 col-sm-10">
                        <asp:Button class="btn btn-success" onclick="BtnSubmit_Click" Text="保 存" runat="server" />
                      </div>
                    </div>
                  </div>
                </div>


              </div>
            </div>
          </div>
        </div>
        <!-- container end -->

        <asp:Literal id="LtlScript" runat="server"></asp:Literal>
      </form>
    </body>

    </html>
    <script src="assets/plugin-utils/js/jquery.min.js"></script>
    <script src="assets/plugin-utils/js/bootstrap.min.js"></script>