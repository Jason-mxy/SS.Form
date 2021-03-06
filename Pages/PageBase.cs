﻿using System;
using System.Web;
using System.Web.UI;
using SS.Form.Core;
using SS.Form.Model;
using SS.Form.Parse;

namespace SS.Form.Pages
{
    public class PageBase : Page
    {
        protected int SiteId { get; private set; }
        protected FormInfo FormInfo { get; private set; }
        protected string ReturnUrl { get; private set; }

        public string PageLogsUrl { get; private set; }

        public string PageResultsUrl { get; private set; }

        public string PageFieldsUrl { get; private set; }

        public string PageSettingsUrl { get; private set; }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            SiteId = Convert.ToInt32(Request.QueryString["siteId"]);
            var channelId = Convert.ToInt32(Request.QueryString["channelId"]);
            var contentId = Convert.ToInt32(Request.QueryString["contentId"]);
            var formId = Convert.ToInt32(Request.QueryString["formId"]);
            FormInfo = formId > 0 ? Main.Instance.FormDao.GetFormInfo(formId) : Main.Instance.FormDao.GetFormInfoOrCreateIfNotExists(SiteId, channelId, contentId);
            ReturnUrl = HttpUtility.UrlDecode(Request.QueryString["returnUrl"]);

            PageLogsUrl = Main.Instance.PluginApi.GetPluginUrl(
                $"{nameof(PageLogs)}.aspx?siteId={SiteId}&formId={FormInfo.Id}&returnUrl={HttpUtility.UrlEncode(ReturnUrl)}");
            PageResultsUrl = Main.Instance.PluginApi.GetPluginUrl(
                $"{nameof(PageResults)}.aspx?siteId={SiteId}&formId={FormInfo.Id}&returnUrl={HttpUtility.UrlEncode(ReturnUrl)}");
            PageFieldsUrl = Main.Instance.PluginApi.GetPluginUrl(
                $"{nameof(PageFields)}.aspx?siteId={SiteId}&formId={FormInfo.Id}&returnUrl={HttpUtility.UrlEncode(ReturnUrl)}");
            PageSettingsUrl = Main.Instance.PluginApi.GetPluginUrl(
                $"{nameof(PageSettings)}.aspx?siteId={SiteId}&formId={FormInfo.Id}&returnUrl={HttpUtility.UrlEncode(ReturnUrl)}");

            if (!Main.Instance.AdminApi.IsSiteAuthorized(SiteId))
            {
                HttpContext.Current.Response.Write("<h1>未授权访问</h1>");
                HttpContext.Current.Response.End();
            }
        }

        public void LbTemplate_Click(object sender, EventArgs e)
        {
            CacheUtils.InsertMinutes("SiteServer.BackgroundPages.Cms.PageTemplatePreview", Main.Instance.DataApi.Encrypt(ParseUtils.GetFormStlElement(FormInfo)), 5);
            var url =
                Main.Instance.FilesApi.GetAdminDirectoryUrl(
                    $"cms/pageTemplatePreview.aspx?siteId={SiteId}&fromCache={true}&returnUrl={Main.Instance.DataApi.Encrypt(PageLogsUrl)}");

            Response.Redirect(Main.Instance.FilesApi.GetAdminDirectoryUrl($"loading.aspx?redirectUrl={Main.Instance.DataApi.Encrypt(url)}"));
        }
    }
}
