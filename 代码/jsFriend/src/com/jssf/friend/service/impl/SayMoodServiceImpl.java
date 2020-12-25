package com.jssf.friend.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jssf.friend.dao.FriendDao;
import com.jssf.friend.dao.SayMoodDao;
import com.jssf.friend.dao.UserDao;
import com.jssf.friend.model.Friend;
import com.jssf.friend.model.SayMood;
import com.jssf.friend.service.SayMoodService;
import com.jssf.friend.utils.Pager;
@Service("sayMoodService")
public class SayMoodServiceImpl implements SayMoodService{
     @Autowired
	private SayMoodDao sayMoodDao;
     @Autowired
 	private UserDao userdao;
     @Autowired
     private  FriendDao friendDao;

	@Override
	public Pager<SayMood> loadPhoto(int userId) {
		// TODO Auto-generated method stub
		return sayMoodDao.loadPhoto(userId);
	}

	@Override
	public void save(SayMood sayMood) {
		// TODO Auto-generated method stub
		sayMoodDao.add(sayMood);
	}

	@Override
	public SayMood loadPhotoById(int id) {
		return sayMoodDao.load(id);
	}

	@Override
	public List<SayMood> loadPhotoBefore(int userId) {
		// TODO Auto-generated method stub
		return sayMoodDao.loadPhotoBefore(userId);
	}

	@Override
	public void update(int id) {
		// TODO Auto-generated method stub
		SayMood say= sayMoodDao.load(id);
		int dz = say.getDzs();
		say.setDzs(dz+1);
		sayMoodDao.update(say);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		SayMood say= sayMoodDao.load(id);
		say.setIsDelete(1);
		sayMoodDao.update(say);
	}

	@Override
	public Pager<SayMood> shuoshioList(int userId) {
		// TODO Auto-generated method stub
		//查询出，我好好友的所有id
		//首先查询我有多少好友
			List<Friend> loadFriends = friendDao.loadFriends(userId);
			Set<Integer> sets = new HashSet<Integer>();
			if(loadFriends == null || loadFriends.size() == 0 ){
				sets.add(userId);
			}else{
				for(Friend f:loadFriends){
					sets.add(f.getUser().getId());
					sets.add(f.getFriendUser().getId());
				}
			}
			
			Pager<SayMood> ss = null;
			if(sets!=null && sets.size()>0){
				ss = sayMoodDao.shuoshioList(sets);
			}
		return ss;
	}

	@Override
	public List<SayMood> zshy() {
		// TODO Auto-generated method stub
		return sayMoodDao.zshy();
	}
	

}
