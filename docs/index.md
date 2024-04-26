# Table of Contents

1. [Use case](#use-case)
2. [Usage](#usage)
3. [Debug Window source](debug_window_source.md)
4. [Log Sender source](log_sender_source.md)

# Use case

This script is specifically designed for collecting and managing logs in the game "Balatro" when modifications are
applied. It caters to developers and players who need to monitor and troubleshoot game behavior affected by mods. The
script offers comprehensive log management functionalities, including filtering logs by logger name or log level,
searching within the logs, and managing log data through saving or clearing operations.

# Usage

1. **Starting the Script**: Ensure the debug console script is running before opening the game.
2. **Filtering Logs**:
    - **By Logger Name**: Enter the logger name in the "Logger Name" field to filter logs by the specified logger.
    - **By Log Level**: Select the log level from the dropdown menu to filter logs by the specified log level.
3. **Searching Logs**:
    - **Focus Search Bar**: Press `Ctrl + F` to focus on the search bar.
    - **Navigate Search Results**: Press `Enter` to move to the next result or `Shift + Enter` to go to the previous
      search result.
    - **Focus on Logger Filter**: Press `Ctrl + L` to directly access the logger filter, streamlining the filtering process.
    - **Exit Search**: Hit `Esc` to move the focus back to the logs.
4. **Managing Logs**:
    - **Save Logs**: Use `Ctrl + S` to save all logs to a file. Press `Ctrl + Shift + S` to save only the filtered logs.
    - **Clear Logs**: Press `Ctrl + D` to clear all logs from the console.