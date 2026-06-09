package vn.neyugntuan.fakenewsdetection.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.neyugntuan.fakenewsdetection.domain.PredictionEntity;

@Repository
public interface PredictRepository extends JpaRepository<PredictionEntity, Long> {

}
