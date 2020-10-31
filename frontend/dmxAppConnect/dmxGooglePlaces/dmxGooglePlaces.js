/*!
 DMXzone Google Places
 Version: 1.0.1
 (c) 2020 DMXzone.com
 @build 2020-09-10 13:21:05
 */
dmx.Component("google-autocomplete",{extends:"input",initialData:{placeId:null,address:null,phone:null,phone2:null,latitude:null,longitude:null,icon:null,name:null,priceLevel:null,rating:null,types:null,url:null,utcOffset:null,vicinity:null,website:null},attributes:{map:{type:String,default:null},country:{type:String,default:null},types:{type:String,default:null},"strict-bounds":{type:Boolean,default:!1},"move-map":{type:Boolean,default:!1}},render:function(t){dmx.BaseComponent.prototype.render.call(this,t),this.$node.value=this.props.value,this.$node.disabled=this.props.disabled,this.$node.defaultValue=this.props.value,this.set("value",this.props.value),this.set("disabled",this.props.disabled),this.target=document.getElementById(this.props.map),this.map=this.target&&this.target.dmxComponent&&this.target.dmxComponent.map,this.autocomplete=new google.maps.places.Autocomplete(this.$node,{strictBounds:this.props["strict-bounds"],types:this.props.types?this.props.types.split(/\s*,\s*/):[]}),this.map&&this.autocomplete.bindTo("bounds",this.map),this.props.country&&this.autocomplete.setComponentRestrictions({country:this.props.country.split(/\s*,\s*/)}),this.autocomplete.addListener("place_changed",this.onchange.bind(this))},update:function(t){this.props.map&&!this.map&&(this.map=this.target&&this.target.dmxComponent&&this.target.dmxComponent.map,this.autocomplete.bindTo("bounds",this.map)),t["strict-bounds"]!=this.props["strict-bounds"]&&this.autocomplete.setOptions({strictBounds:this.props["strict-bounds"]}),t.types!=this.props.types&&this.autocomplete.setOptions({types:this.props.types}),t.country!=this.props.country&&this.autocomplete.setComponentRestrictions({country:this.props.country?this.props.country.split(/\s*,\s*/):[]}),t.disabled!=this.props.disabled&&(this.$node.disabled=this.props.disabled)},onchange:function(){var t=this.autocomplete.getPlace();t.place_id&&(this.set("value",this.$node.value),this.set({placeId:t.place_id,address:t.formatted_address,phone:t.formatted_phone_number,phone2:t.international_phone_number,latitude:t.geometry.location.lat(),longitude:t.geometry.location.lng(),icon:t.icon,name:t.name,priceLevel:t.price_level,rating:t.rating,types:t.types,url:t.url,utcOffset:t.utc_offset,vicinity:t.vicinity,website:t.website}),this.props["move-map"]&&this.map&&(t.geometry.viewport?this.map.fitBounds(t.geometry.viewport):(this.map.setCenter(t.geometry.location),this.map.setZoom(17))),setTimeout(this.dispatchEvent.bind(this,"updated"),100))}}),dmx.Component("google-places-search",{initialData:{results:[],hasMore:!1,status:""},attributes:{map:{type:String,default:null},fields:{type:[Array,String],default:["place_id","business_status","formatted_address","geometry","icon","name","type"]},"show-on-map":{type:Boolean,default:!1}},methods:{findPlaceFromQuery:function(t){var e={},s=t.fields||this.props.fields;this.clearMarkers(),e.query=t.query,e.fields=Array.isArray(s)?s:s.split(/\s*,\s*/),t.bindBounds?e.locationBias=this.map.getBounds():t.latitude&&t.longitude&&(t.radius?e.locationBias={center:{lat:+t.latitude,lng:+t.longitude},radius:+t.radius}:e.locationBias={lat:+t.latitude,lng:+t.longitude}),new google.maps.places.PlacesService(this.map).findPlaceFromQuery(e,this.onresults.bind(this))},findPlaceFromPhoneNumber:function(t){var e={},s=t.fields||this.props.fields;this.clearMarkers(),e.phoneNumber=t.phoneNumber,e.fields=Array.isArray(s)?s:s.split(/\s*,\s*/),t.bindBounds?e.locationBias=this.map.getBounds():t.latitude&&t.longitude&&(t.radius?e.locationBias={center:{lat:+t.latitude,lng:+t.longitude},radius:+t.radius}:e.locationBias={lat:+t.latitude,lng:+t.longitude}),new google.maps.places.PlacesService(this.map).findPlaceFromPhoneNumber(e,this.onresults.bind(this))},nearby:function(t){var e={};this.clearMarkers(),null!=t.latitude&&null!=t.longitude?(e.location={lat:+t.latitude,lng:+t.longitude},e.radius=+t.radius||500):e.bounds=this.map.getBounds(),t.keyword&&(e.keyword=t.keyword),t.name&&(e.name=t.name),t.openNow&&(e.openNow=t.openNow),e.type=t.type,new google.maps.places.PlacesService(this.map).nearbySearch(e,this.onresults.bind(this))},search:function(t){var e={};this.clearMarkers(),null!=t.latitude&&null!=t.longitude?(e.location={lat:+t.latitude,lng:+t.longitude},e.radius=+t.radius||500):e.bounds=this.map.getBounds(),t.openNow&&(e.openNow=t.openNow),t.type&&(e.type=t.type),e.query=t.query,new google.maps.places.PlacesService(this.map).textSearch(e,this.onresults.bind(this))},getMore:function(){this.pagination&&this.pagination.hasNextPage&&this.pagination.nextPage()}},render:function(t){this.markers=[],this.target=document.getElementById(this.props.map),this.map=this.target&&this.target.dmxComponent&&this.target.dmxComponent.map},update:function(t){this.props.map&&!this.map&&(this.map=this.target&&this.target.dmxComponent&&this.target.dmxComponent.map)},clearMarkers:function(){this.markers.forEach(function(t){t.setMap(null)}),this.markers=[]},onresults:function(t,e,s){this.set("status",e),this.set("hasMore",!(!s||!s.hasNextPage)),this.pagination=s,"OK"==e?(this.set("results",t.map(function(t){return{placeId:t.place_id,address:t.formatted_address,latitude:t.geometry.location.lat(),longitude:t.geometry.location.lng(),icon:t.icon,name:t.name,types:t.types}})),this.props["show-on-map"]&&t.forEach(function(t){var e={url:t.icon,size:new google.maps.Size(71,71),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(17,34),scaledSize:new google.maps.Size(25,25)},s=new google.maps.Marker({map:this.map,icon:e,title:t.name,position:t.geometry.location});this.markers.push(s)},this)):console.warn("Places search failed.",e)}});
//# sourceMappingURL=../maps/dmxGooglePlaces.js.map
