package server;

import com.fastcgi.FCGIInterface;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import org.json.JSONObject;

public class FastCGIServer {
    private static final String RESPONSE_TEMPLATE = "Content-Type: application/json\nContent-Length: %d\n\n%s";

    public static void main(String[] args) {
        FCGIInterface fcgi= new FCGIInterface();

        while(fcgi.FCGIaccept() >= 0) {
            long startTime = System.nanoTime();

            try {
                String body = readRequestBody();
                JSONObject jsonRequest = new JSONObject(body);

                double x = jsonRequest.getDouble("x");
                double y = jsonRequest.getDouble("y");
                double r = jsonRequest.getDouble("r");

                boolean isInside = checkHit(x, y, r) && valid(x, y, r);
                long endTime = System.nanoTime();

                String jsonResponse = new JSONObject()
                        .put("result", isInside)
                        .put("x", x)
                        .put("y", y)
                        .put("r", r)
                        .put("currentTime", LocalDateTime.now().toString())
                        .put("executionTime", (endTime - startTime) + "ns").toString();
                sendJson(jsonResponse);
            } catch (Exception e) {
                sendJson(new JSONObject().put("error", e.getMessage()).toString());
            }
        }

    }

    public static boolean checkHit(double x, double y, double r) {
        if (x >= 0 && y >= 0 && y <= r && x <= r && y <= -2 * x + r) {
            return true;
        }
        if (x <= 0 && y <= 0 && (x * x + y * y <= (r / 2) * (r / 2))) {
            return true;
        }
        if (x <= 0 && y >= 0 && x >= -r / 2 && y <= r) {
            return true;
        }
        return false;
    }

    private static boolean valid(double x, double y, double r) {
        return y >= -3.0 && y <= 3.0 && x >= -5.0 && x <= 3.0 && r >= 1.0 && r <= 5.0;
    }

    private static void sendJson(String json) {
        System.out.printf(RESPONSE_TEMPLATE + "%n", json.getBytes(StandardCharsets.UTF_8).length, json);
    }

    private static String readRequestBody() throws IOException {
        FCGIInterface.request.inStream.fill();
        int contentLength = FCGIInterface.request.inStream.available();
        ByteBuffer buffer = ByteBuffer.allocate(contentLength);
        int readBytes = FCGIInterface.request.inStream.read(buffer.array(), 0, contentLength);
        byte[] requestBodyRaw = new byte[readBytes];
        buffer.get(requestBodyRaw);
        buffer.clear();
        return new String(requestBodyRaw, StandardCharsets.UTF_8);
    }
}