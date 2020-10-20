
public with sharing class ExternalToDoCalloutManager {

    @Future(Callout = true)
    public static void postNewToDos(String todosJson) {
        OauthData oauthData = getOauthData();

        if (oauthData.access_token != null) {
            String url = ExternalToDoMetadataManager.getURL();

            Http postHttp = new Http();
            HttpRequest postRequest = new HttpRequest();
            postRequest.setMethod('POST');
            postRequest.setEndpoint(url);
            postRequest.setHeader('Content-Type', 'application/json');
            postRequest.setHeader('Authorization', 'Bearer ' + oauthData.access_token);

            postRequest.setBody(todosJson);
            HttpResponse httpResponse = postHttp.send(postRequest);

            System.debug(httpResponse);
        }

    }


    private static OauthData getOauthData() {
        CredentialsDto credentials = ExternalToDoMetadataManager.getCredentials();

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(ExternalToDoMetadataManager.getOauthUrl());
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setBody(getOauthRequestBody(credentials));
        HttpResponse response = http.send(request);

        return (OauthData) JSON.deserialize(response.getBody(), OauthData.class);
    }

    private static String getOauthRequestBody(CredentialsDto credentials) {
        return 'grant_type=password&' +
                'client_id=' + credentials.clientId + '&' +
                'client_secret=' + credentials.clientSecret + '&' +
                'username=' + credentials.username + '&' +
                'password=' + credentials.password;
    }

}