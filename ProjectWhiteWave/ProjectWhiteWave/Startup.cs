using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ProjectWhiteWave.Startup))]
namespace ProjectWhiteWave
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
