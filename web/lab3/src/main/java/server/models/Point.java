package server.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "points")
public class Point implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double x;
    private double y;
    private double r;

    @Column(name = "is_hit")
    private boolean isHit;

    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

    public Point() {}

    public Point(double x, double y, double r, boolean isHit) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.date = new Date();
    }


}
