import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Course } from './model/course';

@Injectable({
  providedIn: 'root',
})
export class CourseService {
  constructor(private http: HttpClient) {}

  public postCourse(course: Course) {
    return this.http.post('http://k8s-3tiermsa-backend-66b76d4265-408483916.ap-northeast-2.elb.amazonaws.com/postcourse', course, {
      responseType: 'text' as 'json',
    });
  }

  public updateCourse(course: Course) {
    return this.http.put('http://k8s-3tiermsa-backend-66b76d4265-408483916.ap-northeast-2.elb.amazonaws.com/updatecourse', course, {
      responseType: 'text' as 'json',
    });
  }

  public getCourses() {
    return this.http.get('http://k8s-3tiermsa-backend-66b76d4265-408483916.ap-northeast-2.elb.amazonaws.com/getallcourses');
  }

  public getCourseById(courseId: number) {
    return this.http.get(
      'http://k8s-3tiermsa-backend-66b76d4265-408483916.ap-northeast-2.elb.amazonaws.com/getcoursebyid?courseId=' + courseId
    );
  }

  public deleteCourse(courseId: number) {
    return this.http.delete(
      'http://k8s-3tiermsa-backend-66b76d4265-408483916.ap-northeast-2.elb.amazonaws.com/deletecourse?courseId=' + courseId
    );
  }
}
