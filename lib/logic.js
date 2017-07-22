/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Track a loadPickup
 * @param {com.loadblockchain.LoadPickup} loadPickup - the loadPickup to be processed
 * @transaction
 */

function pickupLoad(loadPickup) {
    var load = loadPickup.load
    if (load.state == "PENDING") {
      load.state = "IN_TRANSIT"
      return getAssetRegistry('com.loadblockchain.Load')
          .then(function (assetRegistry) {
              return assetRegistry.update(load);
          });
    } else {
      throw new Error('Load is not available for pickup.  Load state must be PENDING.');
    }
}

/**
 * Track a loadDelivery
 * @param {com.loadblockchain.LoadDelivery} loadDelivery - the loadDelivery to be processed
 * @transaction
 */

function deliverLoad(loadDelivery) {
    var load = loadDelivery.load
    if (load.state == "IN_TRANSIT") {
      load.state = "DELIVERED"
      return getAssetRegistry('com.loadblockchain.Load')
          .then(function (assetRegistry) {
              return assetRegistry.update(load);
          });
    } else {
      throw new Error('Load is not available for delivery.  Load state must be IN_TRANSIT.');
    }
}


/**
 * Track a loadCancel
 * @param {com.loadblockchain.LoadCancellation} loadCancel - the LoadCancellation to be processed
 * @transaction
 */

function cancelLoad(loadCancel) {
    var load = loadCancel.load
    if (load.state != "CANCELED") {
      load.state = "CANCELED"
      return getAssetRegistry('com.loadblockchain.Load')
          .then(function (assetRegistry) {
              return assetRegistry.update(load);
          });
    } else {
      throw new Error('Load is already canceled.');
    }
}
