Feature: Broker

    Background:
        Given I have deployed the business network definition ..
          And I have added the following participants of type com.loadblockchain.Broker
              | brokerId   | name    | MCNumber | URSNumber |
              | BrokerA    | BrokerA | 123      | 123       |
              | BrokerB    | BrokerB | 123      | 123       |
          And I have added the following participants of type com.loadblockchain.Carrier
              | carrierId   | name      | MCNumber | URSNumber |
              | CarrierA    | CarrierA  | 123      | 123       |
              | CarrierB    | CarrierB  | 123      | 123       |
          And I have added the following participants of type com.loadblockchain.Shipper
              | shipperId   | name      |
              | ShipperA    | ShipperA  |
              | ShipperB    | ShipperB  |
          And I have added the following assets of type com.loadblockchain.Load
            """
            [
              {
                "$class": "com.loadblockchain.Load",
                "loadId": "1",
                "state": "PENDING",
                "shipper": "ShipperA",
                "broker": "BrokerA",
                "origin": {
                  "$class":"com.loadblockchain.LoadStop",
                  "scheduledStart": "2017-07-01::00:00:00",
                  "address": {
                    "$class":"com.loadblockchain.Address",
                    "street1": "6003 McComas",
                    "city": "Dallas",
                    "state": "Texas",
                    "zipcode": "75206"
                  }
                },
                "destination": {
                  "$class":"com.loadblockchain.LoadStop",
                  "scheduledStart": "2017-07-01::00:00:00",
                  "address": {
                    "$class":"com.loadblockchain.Address",
                    "street1": "6003 McComas",
                    "city": "Dallas",
                    "state": "Texas",
                    "zipcode": "75206"
                  }
                }
              },
              {
                "$class": "com.loadblockchain.Load",
                "loadId": "2",
                "state": "PENDING",
                "shipper": "ShipperA",
                "broker": "BrokerB",
                "origin": {
                  "$class":"com.loadblockchain.LoadStop",
                  "scheduledStart": "2017-07-01::00:00:00",
                  "address": {
                    "$class":"com.loadblockchain.Address",
                    "street1": "6003 McComas",
                    "city": "Dallas",
                    "state": "Texas",
                    "zipcode": "75206"
                  }
                },
                "destination": {
                  "$class":"com.loadblockchain.LoadStop",
                  "scheduledStart": "2017-07-01::00:00:00",
                  "address": {
                    "$class":"com.loadblockchain.Address",
                    "street1": "6003 McComas",
                    "city": "Dallas",
                    "state": "Texas",
                    "zipcode": "75206"
                  }
                }
              }
            ]
            """
          And I have issued the participant com.loadblockchain.Broker#BrokerA with the identity brokerA
          And I have issued the participant com.loadblockchain.Broker#BrokerB with the identity brokerB

    Scenario: brokerA can add loads that he owns
        When I use the identity brokerA
        And I add the following asset of type com.loadblockchain.Load
            """
            {
              "$class": "com.loadblockchain.Load",
              "loadId": "3",
              "shipper": "ShipperA",
              "broker": "BrokerA",
              "origin": {
                "$class":"com.loadblockchain.LoadStop",
                "scheduledStart": "2017-07-01::00:00:00",
                "address": {
                  "$class":"com.loadblockchain.Address",
                  "street1": "6003 McComas",
                  "city": "Dallas",
                  "state": "Texas",
                  "zipcode": "75206"
                }
              },
              "destination": {
                "$class":"com.loadblockchain.LoadStop",
                "scheduledStart": "2017-07-01::00:00:00",
                "address": {
                  "$class":"com.loadblockchain.Address",
                  "street1": "6003 McComas",
                  "city": "Dallas",
                  "state": "Texas",
                  "zipcode": "75206"
                }
              }
            }
            """
        Then I should have the following assets of type com.loadblockchain.Load
            """
            {
              "$class": "com.loadblockchain.Load",
              "loadId": "3",
              "shipper": "ShipperA",
              "broker": "BrokerA",
              "origin": {
                "$class":"com.loadblockchain.LoadStop",
                "scheduledStart": "2017-07-01::00:00:00",
                "address": {
                  "$class":"com.loadblockchain.Address",
                  "street1": "6003 McComas",
                  "city": "Dallas",
                  "state": "Texas",
                  "zipcode": "75206"
                }
              },
              "destination": {
                "$class":"com.loadblockchain.LoadStop",
                "scheduledStart": "2017-07-01::00:00:00",
                "address": {
                  "$class":"com.loadblockchain.Address",
                  "street1": "6003 McComas",
                  "city": "Dallas",
                  "state": "Texas",
                  "zipcode": "75206"
                }
              }
            }
            """



