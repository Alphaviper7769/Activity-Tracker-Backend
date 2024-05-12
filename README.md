 <h1>Web Activity Time Tracker Backend (Ruby on Rails)</h1>
    <p>This is the backend component of the Web Activity Time Tracker application, built using Ruby on Rails. It provides the necessary APIs and services to support the functionality of the frontend application.</p>
        
<h2>Database Tables</h2>
<p>The following tables represent the database schema of the Web Activity Time Tracker backend, storing essential data such as user information, website details, activity logs, blacklists, notifications, and summaries.
</p>
    <h3>Users</h3>
    <table>
        <tr>
            <th>Field</th>
            <th>Data Type</th>
        </tr>
        <tr>
            <td>name</td>
            <td>string</td>
        </tr>
        <tr>
            <td>email</td>
            <td>string</td>
        </tr>
        <tr>
            <td>password_digest</td>
            <td>string</td>
        </tr>
        <tr>
            <td>created_at</td>
            <td>datetime</td>
        </tr>
        <tr>
            <td>updated_at</td>
            <td>datetime</td>
        </tr>
    </table>

<h3>Websites</h3>
    <table>
        <tr>
            <th>Field</th>
            <th>Data Type</th>
        </tr>
        <tr>
            <td>url</td>
            <td>string</td>
        </tr>
        <tr>
            <td>category</td>
            <td>string</td>
        </tr>
        <tr>
            <td>created_at</td>
            <td>datetime</td>
        </tr>
        <tr>
            <td>updated_at</td>
            <td>datetime</td>
        </tr>
    </table>

<h3>Logs</h3>
    <table>
        <tr>
            <th>Field</th>
            <th>Data Type</th>
        </tr>
        <tr>
            <td>user_id</td>
            <td>bigint</td>
        </tr>
        <tr>
            <td>website_id</td>
            <td>bigint</td>
        </tr>
        <tr>
            <td>duration</td>
            <td>integer</td>
        </tr>
        <tr>
            <td>created_at</td>
            <td>datetime</td>
        </tr>
        <tr>
            <td>updated_at</td>
            <td>datetime</td>
        </tr>
    </table>

<h3>Blacklists</h3>
    <table>
        <tr>
            <th>Field</th>
            <th>Data Type</th>
        </tr>
        <tr>
            <td>user_id</td>
            <td>bigint</td>
        </tr>
        <tr>
            <td>website_id</td>
            <td>bigint</td>
        </tr>
        <tr>
            <td>duration</td>
            <td>integer</td>
        </tr>
        <tr>
            <td>created_at</td>
            <td>datetime</td>
        </tr>
        <tr>
            <td>updated_at</td>
            <td>datetime</td>
        </tr>
    </table>

<h3>Notifications</h3>
    <table>
        <tr>
            <th>Field</th>
            <th>Data Type</th>
        </tr>
        <tr>
            <td>user_id</td>
            <td>bigint</td>
        </tr>
        <tr>
            <td>website_id</td>
            <td>bigint</td>
        </tr>
        <tr>
            <td>duration</td>
            <td>integer</td>
        </tr>
        <tr>
            <td>message</td>
            <td>string</td>
        </tr>
        <tr>
            <td>created_at</td>
            <td>datetime</td>
        </tr>
        <tr>
            <td>updated_at</td>
            <td>datetime</td>
        </tr>
    </table>

<h3>Summaries</h3>
    <table>
        <tr>
            <th>Field</th>
            <th>Data Type</th>
        </tr>
        <tr>
            <td>user_id</td>
            <td>bigint</td>
        </tr>
        <tr>
            <td>website_id</td>
            <td>bigint</td>
        </tr>
        <tr>
            <td>Notiftime</td>
            <td>datetime</td>
        </tr>
        <tr>
            <td>created_at</td>
            <td>datetime</td>
        </tr>
        <tr>
            <td>updated_at</td>
            <td>datetime</td>
        </tr>
    </table>

<h3>websites</h3>
    <table>
        <tr>
            <th>Field</th>
            <th>Data Type</th>
        </tr>
        <tr>
            <td>url</td>
            <td>string</td>
        </tr>
        <tr>
            <td>category</td>
            <td>string</td>
        </tr>
        <tr>
            <td>created_at</td>
            <td>datetime</td>
        </tr>
        <tr>
            <td>updated_at</td>
            <td>datetime</td>
        </tr>
    </table>

<h1>API Documentation</h1>
<p>Below is a list of APIs available in the Web Activity Time Tracker backend.<br> These APIs provide endpoints for user authentication, website management, activity logging, notifications, and reports.
</p>
    <h2>Namespace: api</h2>
    <ul>
        <li><strong>POST</strong> /register - Create a new user</li>
        <li><strong>POST</strong> /login - Log in user</li>
        <li><strong>POST</strong> /logout - Log out user</li>
        <br>
        <li><strong>GET</strong> /websites - Get list of websites</li>
        <li><strong>POST</strong> /websites/add - Add a new website</li>
        <li><strong>DELETE</strong> /websites/delete/:id - Delete a website</li>
        <br>
        <li><strong>POST</strong> /activity - Log activity</li>
        <li><strong>GET</strong> /activity/summary - Get activity summary</li>
        <br>
        <li><strong>GET</strong> /blacklist - Get blacklist</li>
        <li><strong>POST</strong> /blacklist/add - Add website to blacklist</li>
        <li><strong>DELETE</strong> /blacklist/delete/:id - Remove website from blacklist</li>
        <li><strong>GET</strong> /blacklist/check - Check if website is in blacklist</li>
        <br>
        <li><strong>GET</strong> /notifications - Get notifications</li>
        <li><strong>POST</strong> /notifications/add - Add a notification</li>
        <li><strong>DELETE</strong> /notifications/delete/:id - Remove a notification</li>
        <li><strong>GET</strong> /notifications/check - Check if notification exists</li>
        <br>
        <li><strong>GET</strong> /reports/daily - Get daily reports</li>
        <li><strong>GET</strong> /reports/weekly - Get weekly reports</li>
    </ul>

<h2>Testing</h2>

<p>This project includes automated tests to ensure the reliability and stability of the backend functionality. The tests cover various aspects of the application, including models, controllers, and API endpoints.</p>

<h3>Running Tests</h3>

<p>To run the tests, follow these steps:</p>

<ol>
        <li>Make sure all dependencies are installed by running:
            <pre><code>bundle install</code></pre>
        </li>
        <li>Run the test suite using the following command:
            <pre><code>bundle exec rspec</code></pre>
        </li>
    </ol>


<h2>Getting Started</h2>

<p>To set up and run the backend locally, follow these steps:</p>

<h3>Installation:</h3>
    <p>Clone the repository to your local machine.</p>
    <pre><code>git clone https://github.com/your-username/web-activity-time-tracker-backend.git</code></pre>

<h3>Setup Environment:</h3>
    <p>Install dependencies using Bundler.</p>
    <pre><code>cd web-activity-time-tracker-backend</code></pre>
    <pre><code>bundle install</code></pre>

<h3>Database Setup:</h3>
    <p>Create the database and run migrations.</p>
    <pre><code>rails db:create</code></pre>
    <pre><code>rails db:migrate</code></pre>

<h3>Start the Server:</h3>
    <p>Launch the backend server.</p>
    <pre><code>rails s</code></pre>

<p>The backend should now be running locally on <a href="http://localhost:3000">http://localhost:3000</a>. You can use tools like Postman or curl to interact with the API endpoints.</p>

<h2>Contributing</h2>
    <p>Contributions to the backend codebase are welcome! If you have suggestions for improvements, bug fixes, or new features, please open an issue or submit a pull request.</p>

<p>Before contributing, please review the <a href="#">contribution guidelines</a>.</p>

<h2>License</h2>
    <p>This project is licensed under the MIT License.</p>