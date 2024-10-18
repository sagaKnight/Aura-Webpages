# Aura Fashion Website

<p>Aura is a full-stack fashion website which allows users to simulate purchasing clothes from popular streetwear brands. The website follows mobile-first principles and a minimalist design.</p> 
![alt text](https://raw.githubusercontent.com/sagaKnight/Aura-Webpages/main/GitHub%20Images/homepage.png)

## Interactive Features

#### Integrated Shopping Cart
<p>Users are able to add items to their cart and maintain their selections across page refreshes (Vuex Persisted State).</p>

#### Responsive Design
<p>Ensures optimal viewing and interaction on mobile devices, enhancing user experience across various screen sizes (Bootstrap).</p>

#### Dynamic Content Retrieval
<p>Information is dynamic and fetched from a MySQL database, allowing for changes to product listings and availability (MySQL, Node.js).</p>

#### Order Management Page
<p>Staff can view and manage customer orders directly from the SQL database, allowing for order tracking.</p>

#### Order Processing
<p>When users complete their purchases, the order details are uploaded to the MySQL database.</p>

## Technologies Used

<ul>
    <li><strong>Frontend:</strong>
        <ul>
            <li>HTML5: For structuring the web pages.</li>
            <li>CSS3: For styling and layout design.</li>
            <li>JavaScript: Used in conjunction with Vue.js for dynamic content and interactivity.</li>
            <li>Vue.js: For building the user interface with a component-based architecture.</li>
        </ul>
    </li>
    <li><strong>Backend:</strong>
        <ul>
            <li>Node.js: For building server-side applications.</li>
            <li>Express.js: A web application framework for Node.js that simplifies routing and middleware handling.</li>
            <li>MySQL: For managing and storing relational data.</li>
        </ul>
    </li>
    <li><strong>Additional Tools:</strong>
        <ul>
            <li>Axios: For making HTTP requests from the frontend to the backend.</li>
        </ul>
    </li>
</ul>

## How to Install & Run

<ol>
    <li>
        <p>Clone this repository to your local machine using the following command:</p> 
        <pre><code>git clone https://github.com/sagaKnight/Aura-Webpages.git</code></pre>
    </li>
    <li>
        <strong>Set Up the MySQL Database</strong>
        <ol>
            <li>Start XAMPP: Open XAMPP Control Panel and start the Apache and MySQL services.</li>
            <li>
                <strong>Import the Database:</strong>
                <p>Open phpMyAdmin by going to <code>http://localhost/phpmyadmin</code>.</p>
                <p>Create a new database (e.g., <code>auraproject.sql</code>).</p>
                <p>Select the database and click on the "Import" tab.</p>
                <p>Choose the exported <code>.sql</code> file from the <code>database</code> folder in your project.</p>
                <p>Click "Go" to import the database.</p>
            </li>
        </ol>
    </li>
    <li>
        <strong>Install Project Dependencies</strong>
        <p>Navigate to the Vue.js app directory (if it's within your main project folder) and install the necessary dependencies:</p>
        <pre><code>cd Aura-Website</code></pre>
        <pre><code>npm install</code></pre>
    </li>
    <li>
        <strong>Start the Node Server</strong>
        <p>Open a new terminal, navigate to the <code>Aura-Website/src</code> directory, and start the Node server by running:</p>
        <pre><code>cd Aura-Website/src</code></pre>
        <pre><code>node server.js</code></pre>
        <p>If successful, "connected to database" will be outputted to the terminal.</p>
    </li>
    <li>
        <strong>Run the Development Server</strong>
        <p>Go back to your original terminal where you installed the project dependencies and start the development server by running:</p>
        <pre><code>npm run dev</code></pre>
        <p>You should see output similar to this:</p>
        <pre><code> VITE vX.X.X  ready in X seconds

 ➜  Local:   http://localhost:5173/
 ➜  Network: use --host to expose</code></pre>
    </li>
    <li>
        <strong>Open the App in Your Browser</strong>
        <p>Open your web browser and go to <code>http://localhost:5173/</code> to view the website.</p>
    </li>
</ol>



