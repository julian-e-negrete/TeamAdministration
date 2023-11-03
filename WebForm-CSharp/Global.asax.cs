using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using WebForm_CSharp.Utils;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System.Threading;

namespace WebForm_CSharp
{
    public class Global : HttpApplication
    {

        private IServiceCollection serviceCollection;
        private ServiceProvider serviceProvider; 
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Create a service collection.
            var serviceCollection = new ServiceCollection();

            // Add the hosted service to the service collection.
            serviceCollection.AddHostedService<MyBackgroundService>();

            // Build the service provider.
            var serviceProvider = serviceCollection.BuildServiceProvider();

            // Start the background service.
            serviceProvider.GetService<IHostedService>().StartAsync(CancellationToken.None).GetAwaiter().GetResult();
        }

        protected void Application_End(object sender, EventArgs e)
        {
            // Dispose of the service provider.
            serviceProvider.Dispose();
        }

    }
}