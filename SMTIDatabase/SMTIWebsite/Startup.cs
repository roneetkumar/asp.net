using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SMTIWebsite.Startup))]
namespace SMTIWebsite
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
