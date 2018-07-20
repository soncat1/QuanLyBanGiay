using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(QuanLyBanGiay.Startup))]
namespace QuanLyBanGiay
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
