using System;
using System.Data;

// Twilio
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

using Microsoft.Extensions.Hosting;
using System.Threading.Tasks;
using System.Threading;

using System.Net.Http;
using System.Text.Json;


namespace WebForm_CSharp.Utils
{
    public class MyBackgroundService : IHostedService
    {
        public class numeros
        {
            public int countsms = 0;
        }
        public class Blue
        {
            public double value_avg { get; set; }
            public double value_sell { get; set; }
            public double value_buy { get; set; }
        }

        public class Oficial
        {
            public double value_avg { get; set; }
            public double value_sell { get; set; }
            public double value_buy { get; set; }
        }

        public class Root
        {
            public Oficial oficial { get; set; }
            public Blue blue { get; set; }
        }

        public async Task StartAsync(CancellationToken cancellationToken)
        {
            // Initialize the Twilio client.
            TwilioClient.Init("ACe7032f90fb3e1bf2d49f904fd41c5b2c", "c1862461a079c0c4d81287ff3867e277");
            DateTime dt = DateTime.Now;
            if (dt.Month == 11)
            {
                while (!cancellationToken.IsCancellationRequested)
                {

                    try
                    {
                        // Create a new HttpClient object.
                        var client = new HttpClient();

                        // Make a GET request to the Bluelytics API to retrieve the dólar blue selling price.
                        var response = client.GetAsync("https://api.bluelytics.com.ar/v2/latest").Result;

                        // Check if the response was successful.
                        if (response.IsSuccessStatusCode)
                        {
                            // Read the response body as JSON.
                            var json = response.Content.ReadAsStringAsync().Result;

                            // Get json                 
                            var jsonObject = JsonSerializer.Deserialize<Root>(json);

                            decimal dolarBlueValue = Convert.ToDecimal(jsonObject.blue.value_sell);

                            if (dolarBlueValue <= 1000)
                            {
                                

                                // Create a dictionary of people we know, indexed by phone number.
                                var people = new Dictionary<string, string>()
                                {
                                    {"+541124037774", "Julian Negrete"},
                                    {"+541124050722", "Diego Negrete"},
                                };

                                // Iterate over all our friends.
                                foreach (var person in people)
                                {
                                    // Send a new outgoing SMS by POSTing to the Messages resource.
                                    MessageResource.Create(
                                        from: new PhoneNumber("+16414183152"), // From number, must be an SMS-enabled Twilio number
                                        to: new PhoneNumber(person.Key), // To number, if using Sandbox see note above
                                        body: $"Valor dolar blue ${dolarBlueValue} !"
                                    );
                                    var numeros = new numeros();
                                    numeros.countsms++;
                                }

                                
                            }
                            
                        }

                     await Task.Delay(TimeSpan.FromMinutes(1));
                    }
                    catch (Exception ex)
                    {

                    }
                }    
                
                
            }
        }

        public class DolarApiResponse
        {
            public string Nombre { get; set; }
            public string ValorVenta { get; set; }
            public string Variacion { get; set; }
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            // Do some cleanup work.
            return Task.CompletedTask;
        }
    }
}
