
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AgroChat - Smart Farmer Assistant</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
        }
        .chat-container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .chat-header {
            background: #16a085;
            color: white;
            padding: 10px;
            text-align: center;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }
        .chat-body {
            height: 400px;
            overflow-y: auto;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .chat-footer {
            padding: 10px;
            display: flex;
            gap: 10px;
            background: #f9f9f9;
            border-top: 1px solid #ddd;
        }
        .user-message, .bot-message {
            padding: 10px;
            border-radius: 8px;
            max-width: 75%;
        }
        .user-message {
            background: #16a085;
            color: white;
            align-self: flex-end;
        }
        .bot-message {
            background: #ddd;
            align-self: flex-start;
        }
    </style>
</head>
<body>
    <div class="chat-container">
        <div class="chat-header">
            <h3>AgroChat - Your Smart Farming Assistant</h3>
        </div>
        <div class="chat-body" id="chatBody">
            <!-- Chat messages will appear here -->
        </div>
        <div class="chat-footer">
            <form id="chatForm" method="POST" style="flex-grow: 1; display: flex; gap: 10px;">
                <input type="text" name="userMessage" id="userInput" class="form-control" placeholder="Ask me anything about farming..." required>
                <button type="submit" class="btn btn-success">Send</button>
            </form>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        const chatBody = document.getElementById("chatBody");

        function appendMessage(content, isUser) {
            const messageDiv = document.createElement("div");
            messageDiv.className = isUser ? "user-message" : "bot-message";
            messageDiv.textContent = content;
            chatBody.appendChild(messageDiv);
            chatBody.scrollTop = chatBody.scrollHeight; // Auto-scroll to the bottom
        }

        // Handle form submission for chatbot
        document.getElementById("chatForm").addEventListener("submit", function (event) {
            event.preventDefault();

            const userInput = document.getElementById("userInput");
            const message = userInput.value.trim();
            if (message === "") return;

            // Add user message to the chat
            appendMessage(message, true);
            userInput.value = "";

            // Add hidden field for form submission
            const hiddenField = document.createElement("input");
            hiddenField.type = "hidden";
            hiddenField.name = "processChat";
            hiddenField.value = "true";
            this.appendChild(hiddenField);

            // Submit form
            this.submit();
        });
    </script>

    <% 
        // Process chatbot logic
        String userMessage = request.getParameter("userMessage");
        if (userMessage != null) {
            try {
                // OpenAI GPT-4 API Configuration
                String apiKey = "YOUR_API_KEY_HERE"; // Replace with your API key
                String apiUrl = "https://api.openai.com/v1/chat/completions";

                // Build JSON payload
                JSONObject payload = new JSONObject();
                payload.put("model", "gpt-4");
                JSONArray messages = new JSONArray();
                messages.put(new JSONObject().put("role", "user").put("content", userMessage));
                payload.put("messages", messages);

                // Setup HTTP connection
                URL url = new URL(apiUrl);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("POST");
                connection.setRequestProperty("Authorization", "Bearer " + apiKey);
                connection.setRequestProperty("Content-Type", "application/json");
                connection.setDoOutput(true);

                // Send request
                OutputStream os = connection.getOutputStream();
                os.write(payload.toString().getBytes());
                os.flush();
                os.close();

                // Read response
                BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    response.append(line);
                }
                br.close();

                // Parse and display bot response
                JSONObject jsonResponse = new JSONObject(response.toString());
                String botResponse = jsonResponse.getJSONArray("choices").getJSONObject(0).getJSONObject("message").getString("content");
    %>
                <script>
                    appendMessage("<%= botResponse %>", false);
                </script>
    <%
            } catch (Exception e) {
                e.printStackTrace();
    %>
                <script>
                    appendMessage("Sorry, I couldn't process your request. Please try again later.", false);
                </script>
    <%
            }
        }
    %>
</body>
</html>
