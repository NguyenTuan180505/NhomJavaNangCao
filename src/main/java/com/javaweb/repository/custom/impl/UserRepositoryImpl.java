package com.javaweb.repository.custom.impl;

import com.javaweb.entity.UserEntity;
import com.javaweb.repository.custom.UserRepositoryCustom;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
public class UserRepositoryImpl implements UserRepositoryCustom {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<UserEntity> findByRole(String roleCode) {
		//JPQL
		String sql = "FROM UserEntity";
		Query query = entityManager.createNativeQuery(sql, UserEntity.class);
		return query.getResultList();
	}

	@Override
	public List<UserEntity> getAllUsers(Pageable pageable) {
		// Sử dụng Criteria API để xây dựng truy vấn
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<UserEntity> criteriaQuery = criteriaBuilder.createQuery(UserEntity.class);
		Root<UserEntity> root = criteriaQuery.from(UserEntity.class);

		// Lọc theo điều kiện status = 1
		Predicate statusPredicate = criteriaBuilder.equal(root.get("status"), 1);
		criteriaQuery.where(statusPredicate);

		// Phân trang với SQL Server - sử dụng setFirstResult và setMaxResults
		javax.persistence.Query query = entityManager.createQuery(criteriaQuery);
		query.setFirstResult(pageable.getPageNumber() * pageable.getPageSize());
		query.setMaxResults(pageable.getPageSize());

		return query.getResultList();
	}

	@Override
	public int countTotalItem() {
		// Đếm tổng số bản ghi
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
		Root<UserEntity> root = criteriaQuery.from(UserEntity.class);

		// Lọc theo điều kiện status = 1
		Predicate statusPredicate = criteriaBuilder.equal(root.get("status"), 1);
		criteriaQuery.where(statusPredicate);

		// Câu truy vấn đếm tổng số bản ghi
		criteriaQuery.select(criteriaBuilder.count(root));

		javax.persistence.Query query = entityManager.createQuery(criteriaQuery);
		return ((Long) query.getSingleResult()).intValue();
	}

}
