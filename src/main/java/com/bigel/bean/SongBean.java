package com.bigel.bean;

import com.bigel.entity.Song;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;

@Stateless
public class SongBean {
    @PersistenceContext(unitName = "PERSISTENCE_UNIT")
    private EntityManager entityManager;

    public List<Song> findAll() {
        return entityManager.createQuery("SELECT p from Song p", Song.class).getResultList();
    }

    public Song findById(Long id) {
        return entityManager.find(Song.class, id);
    }

    public void deleteById(Long id) {
        entityManager.remove(findById(id));
    }

    public void save(Song song) {
        entityManager.persist(song);
    }

    public void edit(Long id, Song song) {
        Song existingSong = findById(id);
        if (existingSong != null) {
            existingSong.setTitle(song.getTitle());
            existingSong.setArtist(song.getArtist());
            entityManager.merge(existingSong);
        }
    }
}
