public with sharing class ExternalToDoCalloutManager {
    public final static String METHOD_POST = 'POST';
    public final static String METHOD_PUT = 'PUT';
    public final static String METHOD_DELETE = 'DELETE';

    @Future(Callout = true)
    public static void sendRequest(String jsonToSend, String url, String httpMethod) {
        sendRequestSync(jsonToSend, url, httpMethod);
    }

    public static void sendRequestSync(String jsonToSend, String url, String httpMethod) {
        OauthData oauthData = getOauthData();

        if (oauthData.access_token != null) {

            Http postHttp = new Http();
            HttpRequest postRequest = new HttpRequest();
            postRequest.setMethod(httpMethod);
            postRequest.setEndpoint(url);
            postRequest.setHeader('Content-Type', 'application/json');
            postRequest.setHeader('Authorization', 'Bearer ' + oauthData.access_token);
            postRequest.setBody(jsonToSend);

            HttpResponse httpResponse = postHttp.send(postRequest);

            System.debug('External Org Callout Response: ' + httpResponse);
        }

    }


    private static OauthData getOauthData() {
        CredentialsDto credentials = ExternalToDoMetadataManager.getCredentials();

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(ExternalToDoMetadataManager.getOauthUrl());
        request.setMethod(METHOD_POST);
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