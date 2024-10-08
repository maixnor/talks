module com.maixnor.javafx {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.maixnor.javafx to javafx.fxml;
    exports com.maixnor.javafx;
}