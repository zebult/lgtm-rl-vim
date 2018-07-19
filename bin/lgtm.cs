using System;
using System.Linq;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

// mcs /reference:System.Net.Http.dll lgtm.cs
class LGTM
{
    static void Main(string[] args)
    {
        int lgtmCount = int.Parse(args[0]);

        var tasks = Enumerable.Range(1, lgtmCount).Select(x => GetImageURL());
        var all   = Task.WhenAll(tasks);
        all.Result.ToList().ForEach(x => Console.WriteLine(x));
    }

    static async Task <string> GetImageURL()
    {
        var client = new HttpClient();
        client.DefaultRequestHeaders.Add("Accept", "application/json");

        string result = await client.GetStringAsync("http://www.lgtm.in/g").ConfigureAwait(false);

        // TODO use json
        int    imageUrlIndex = result.IndexOf("imageUrl");
        int    startIndex    = result.IndexOf('"', imageUrlIndex + 9);
        int    endIndex      = result.IndexOf('"', startIndex + 1);
        string url           = result.Substring(startIndex + 1, endIndex - startIndex - 1);

        string imageUrl = "`![LGTM](" + url + ")`\n\n" + "![LGTM](" + url + ")\n\n";

        return imageUrl;
    }
}
