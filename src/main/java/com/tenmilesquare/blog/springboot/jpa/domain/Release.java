package com.tenmilesquare.blog.springboot.jpa.domain;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "release")
public class Release {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "release_id")
    private Long releaseId;

    @ManyToMany(mappedBy = "releases")
    private Set<Recording> recordings = new HashSet<>();

    @Column(name = "title")
    private String title;

    public Long getReleaseId() {
        return releaseId;
    }

    public void setReleaseId(Long releaseId) {
        this.releaseId = releaseId;
    }

    public Set<Recording> getRecordings() {
        return recordings;
    }

    public void setRecordings(Set<Recording> recordings) {
        this.recordings = recordings;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
