# Description:
#   Communicates with the API on GhostInspector for WWWINC
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot gi suite list - list available suites
#   hubot gi test list - lists all available tests
#
# Author:
#   pbuzzell
module.exports = (robot) ->
  robot.respond /postman stg (.*)/i, (msg) ->
    if msg.match[1]
      brand = msg.match[1]
    else
      brand = "batesfootwear_us"
    url = "https://storefront:storefront123@staging-na-wwwinc.demandware.net/on/demandware.store/Sites-#{brand}-Site/default/EmailQueueService-SendShipConfirm"
    data = {
      "orderID":"W1024853560",
      "orderDate":"Wed, 16 Mar 2016 16:22:24 GMT",
      "orderIsFullyShipped":"1",
      "shipToAddress1":"9341 Courtland Dr",
      "shipToCity":"Rockford",
      "shipToCountry":"US",
      "shipToName":"Pete Buzzell",
      "shipToPostalCode":"49351",
      "shipToRegion":"MI",
      "shippingType":"Standard",
      "subtotalAmount":"$340.00",
      "taxAmount":"$0.00",
      "totalAmount":"$340.00",
      "trackingNumber":"TESTING123",
      "trackingUrl":"http://www.wolverine.com",
      "orderItems":[
        {
          "productID":"646881846308",
          "quantity":1
        },
        {
          "productID":"018469933166",
          "quantity":1
        }
      ],
      "emailAddress":"pete.buzzell@wwwinc.com",
      "localeID":"en-US",
      "siteID":"#{brand}",
      "version":1
      }
    msg.http(url)
      .header('dwemailqueue-apikey', 'sD30q5mmaXi8zwOLxtVYuSMVBFzkrFt7WHMX4KmgLcPLsZ9hvyhFiySSprIvSEV')
      .post(data) (err, res, body) ->
        try
          json = JSON.parse body
          console.log(json)
          if json.messageID 
            msg.send json.description
          else
            msg.send "Failure"
        catch error
          msg.send "Fucking errors!"