<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version='1.0' xmlns:xsl = 'http://www.w3.org/1999/XSL/Transform'>
<xsl:template match='/'>
<html>
<head>
    <title>Destinations - Your Travel Planner</title>
    <style>
        .destination-container {
            margin-top: 150px;
            max-height: 800px;
            overflow-y: auto; 
        }

        .destination-packages {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            flex-wrap: wrap;
            gap: 20px;
            overflow-y: auto;
            padding: 20px;
            justify-items: center;
            margin-top: 300px;
        }

        .destination-package {
            background-color: #fff;
            width: 400px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.2s ease-in-out;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            text-align: center;
        }

        .destination-package:hover {
            transform: scale(1.05);
        }

        .destination-image {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%; 
            margin-bottom: 10px;
        }

        .destination-details {
            margin-top: auto; 
        }

        
    </style>
</head>
<body style="margin: 0; font-family: Arial, sans-serif; overflow: hidden; background-color: #f2f2f2;">
    <div class="nav" style="position: fixed; top: 0; left: 0; width: 100%; background-color: rgba(0, 0, 0, 0.7); display: flex; justify-content: left; align-items: center; padding: 10px 0; z-index: 1000;">
        <h1 style="font-style: url('madelina.ttf'); color: white;">Your Travel Planner</h1>
        <img src="logoPlanner.png" style="height: 200px; width: 200px;" />
        <a href="dashboard.html" style="color: #fff; text-decoration: none; margin: 0 15px; font-size: 16px;">Home</a>
        <a href="#" style="color: #fff; text-decoration: none; margin: 0 15px; font-size: 16px;">Destinations</a>
        <a href="#" style="color: #fff; text-decoration: none; margin: 0 15px; font-size: 16px;">Itineraries</a>
        <a href="#" style="color: #fff; text-decoration: none; margin: 0 15px; font-size: 16px;">Profile</a>
        <a href="form.html" style="color: #fff; text-decoration: none; margin: 0 15px; font-size: 16px;">Logout/Login</a>
    </div>

    <xsl:for-each select="destinations/place">
        <div class="destination-container">
        <div class="destination-packages">
            <div class="destination-package">
                <img class="destination-image" src="image.jpg" alt="Destination" />
                <div class="destination-details">
                    <h2><xsl:value-of select="name" /></h2>
                    <p><xsl:value-of select="tagline" /></p>
                    <button class="explore-button">Explore</button>
                    <button class="book-button">Book</button>
                </div>
            </div>     
        </div>
    </div>
    </xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
