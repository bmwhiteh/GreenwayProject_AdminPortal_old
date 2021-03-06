﻿
    <%--Name: Default
    Edits:
          - 8/16/17 Bailey Whitehill
    --%>
        

<%--Equivalent to the HTML header I believe--%>
<%@ Page Title="Heat Map" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="HeatMap.aspx.cs" Inherits="web_application.HeatMap" %>


<%--This is the top gradient gray header of the web page--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      #grad {
        font-size: 25px;
        position: relative;
        top: 300px;
        left: 50px;   
        height: 100px;
        width: 300px;

        /* For Safari 5.1 to 6.0 */
        background: -webkit-linear-gradient(left, rgba(0,255, 255,1), rgba(0,127,255,1), rgba(0,0,255,1), rgba(0,0,191,1), rgba(0,0,127,1), rgba(63, 0, 127,1), rgba(127, 0, 63,1), rgba(255,0, 0,1)); 
        
        /* For Opera 11.1 to 12.0 */
        background: -o-linear-gradient(right, rgba(0,255, 255,1), rgba(0,127,255,1), rgba(0,0,255,1), rgba(0,0,191,1), rgba(0,0,127,1), rgba(63, 0, 127,1), rgba(127, 0, 63,1), rgba(255,0, 0,1)); 
        
        /* For Fx 3.6 to 15 */
        background: -moz-linear-gradient(right, rgba(0,255, 255,1), rgba(0,127,255,1), rgba(0,0,255,1), rgba(0,0,191,1), rgba(0,0,127,1), rgba(63, 0, 127,1), rgba(127, 0, 63,1), rgba(255,0, 0,1)); 
        
        /* Standard syntax (must be last) */
        background: linear-gradient(to right, rgba(0,255, 255,1), rgba(0,127,255,1), rgba(0,0,255,1), rgba(0,0,191,1), rgba(0,0,127,1), rgba(63, 0, 127,1), rgba(127, 0, 63,1), rgba(255,0, 0,1)); 
}
    </style>
</asp:Content>


<%-- This is the heat map section of the page--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">

     <%--Page Title--%>
    <div id="page-heading">
        <h1>Heat Map</h1>
        <hr style="width: 98%; color: lightgray;" />
    </div>

     <%--End Page Title--%>

    <%-- This is the bar that shows the color coordination for the graph  --%>
    <div style="height: 100%; margin: 0 auto;">
        <div id="heatmapContents">
            <div id="contents">
                <div style="position: relative; top: 280px; left: 125px;">
                   <h1>Density Range</h1>
                </div>
                <div id="grad" style="border: 1px solid black;">
                    <span style="float: left; color:white">Low</span><span style="float: right; color:white">High</span>
                </div>
                <div class="panel map-container" style="background-color: #D3D9DF">
                    <div class="panel-body panel-body-custom">
                        <div id="map" style="height: 600px; width: 600px; margin: 0 auto;"></div>
                    </div>
                </div>
            </div>
        </div>

        <%-- Javascript using the Google Maps service and KML file to overlay the trail network--%>
        <script>
            // This example requires the Visualization library. Include the libraries=visualization
            // parameter when you first load the API. For example:
            //<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=visualization">

            var map, heatmap;
            var pathUrl = "23.97.29.252:50000/Capstone/datarelay.svc/trails/api/1/Path/All";

            <%--Initialize the heat map to a basic overlay of KML file onto Google Map--%>
            function initMap()
            {
                // create the map object
                map = new google.maps.Map(document.getElementById('map'),
                {
                    zoom: 13,
                    center: { lat: 41.1188, lng: -85.1090 },
                    mapTypeId: google.maps.MapTypeId.SATELLITE
                });
                // heatmap layer
                heatmap = new google.maps.visualization.HeatmapLayer(
                {
                    data: getPaths(),
                    map: map
                });

                // overlay of the Fort Wayne Regional Trail Network
                <%--We need a way to allow user input of this file rather than linking directly to the Github account it is stored in--%>
                var ctaLayer = new google.maps.KmlLayer(
                {
                    url: 'https://gist.githubusercontent.com/scottyseus/ec2e4892d5f53920390e/raw/47128a99e128ba78ea8b5d7b476544766b0e5f5c/overlay.kml',
                    map: map
                });

                
            }


            <%--Allow User to move the Heat Map around to focus on a specific section--%>
            function toggleHeatmap()
            {
                heatmap.setMap(heatmap.getMap() ? null : map);
            }


            function changeGradient()
            {
                var gradient =
                [
                    'rgba(0, 255, 255, 0)',
                    'rgba(0, 255, 255, 1)',
                    'rgba(0, 191, 255, 1)',
                    'rgba(0, 127, 255, 1)',
                    'rgba(0, 63, 255, 1)',
                    'rgba(0, 0, 255, 1)',
                    'rgba(0, 0, 223, 1)',
                    'rgba(0, 0, 191, 1)',
                    'rgba(0, 0, 159, 1)',
                    'rgba(0, 0, 127, 1)',
                    'rgba(63, 0, 91, 1)',
                    'rgba(127, 0, 63, 1)',
                    'rgba(191, 0, 31, 1)',
                    'rgba(255, 0, 0, 1)'
                ]
                heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
            }


            function changeRadius()
            {
                heatmap.set('radius', heatmap.get('radius') ? null : 20);
            }


            function changeOpacity()
            {
                heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
            }

            <%--This obtains the Trails Network using the API--%>
            function getPaths()
            {
                $.ajax({
                    type: 'GET',
                    contentType: "application/json' charset=utf-8",
                    url: "http://23.97.29.252:50000/Capstone/datarelay.svc/trails/api/1/Path/All",
                    data: {},
                    datatype: 'json',
                    complete: function (res)
                    {
                        var paths = res.responseJSON;

                        displayPaths(paths);
                    }

                })
            }

            <%--This displays the paths that have been retrieved from the API onto the Heat Map--%>
            function displayPaths(paths)
            {
                var points = [];
                for (index in paths)
                {
                    points = points.concat(parsePath(paths[index]['path']));
                }

                // heatmap layer
                heatmap = new google.maps.visualization.HeatmapLayer({
                    data: points,
                    map: map
                });

                var gradient = [
                    'rgba(0, 255, 255, 0)',
                    'rgba(0, 255, 255, 1)',
                    'rgba(0, 191, 255, 1)',
                    'rgba(0, 127, 255, 1)',
                    'rgba(0, 63, 255, 1)',
                    'rgba(0, 0, 255, 1)',
                    'rgba(0, 0, 223, 1)',
                    'rgba(0, 0, 191, 1)',
                    'rgba(0, 0, 159, 1)',
                    'rgba(0, 0, 127, 1)',
                    'rgba(63, 0, 91, 1)',
                    'rgba(127, 0, 63, 1)',
                    'rgba(191, 0, 31, 1)',
                    'rgba(255, 0, 0, 1)'
                ]

                heatmap.set('gradient', gradient);
                heatmap.set('opacity', 1);
                heatmap.set('radius', 20);
            }

            <%--This goes through the paths and determines where to place a point on the map--%>
            function parsePath(path)
            {
                var points = [];
                var coords = path.split(/[ ,]+/);
                for (i = 0; i < coords.length; i++)
                {
                    var lat = coords[i]
                    var long = coords[++i]
                    if (!lat.isEmpty() && !long.isEmpty())
                    {
                        points.push(new google.maps.LatLng(lat, long));
                    }
                }
                return points;
            }

            <%--Not sure what this is--%>
            String.prototype.isEmpty = function ()
            {
                return (this.length === 0 || !this.trim());
            };

            // Heatmap data: 500 Points
            function getPoints()
            {
                return [
                    new google.maps.LatLng(41.116087600, -85.114176000)
                ]
            }
        </script>

        <!-- Include the Google Maps library -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCA2nlNoi_tXPHrq6ER0UbsOYXDDPSeghQ&libraries=visualization&callback=initMap">
        </script>

    </div>

</asp:Content>


