package com.tenmilesquare.blog.springboot.jpa.domain;

import javax.persistence.*;

@Entity
@Table(name = "ranking")
public class Ranking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ranking_id")
    private Long rankingId;

    @Column(name = "user_rating")
    private Integer userRatings;

    @Column(name = "overall_rating")
    private Integer overallRating;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "agent_id")
    private Artist artist;

    public Long getRankingId() {
        return rankingId;
    }

    public void setRankingId(Long rankingId) {
        this.rankingId = rankingId;
    }

    public Integer getUserRatings() {
        return userRatings;
    }

    public void setUserRatings(Integer userRatings) {
        this.userRatings = userRatings;
    }

    public Integer getOverallRating() {
        return overallRating;
    }

    public void setOverallRating(Integer overallRating) {
        this.overallRating = overallRating;
    }

    public Artist getArtist() {
        return artist;
    }

    public void setArtist(Artist artist) {
        this.artist = artist;
    }
}
